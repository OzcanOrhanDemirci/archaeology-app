import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../data/localization.dart';
import '../state/state.dart';

/// A run of text; [isGlossaryTerm] marks runs that match a glossary term
/// and should render as tappable links.
class TextSegment {
  final String text;
  final bool isGlossaryTerm;

  const TextSegment(this.text, {this.isGlossaryTerm = false});
}

/// Glossary term titles mapped to their definitions, filtered to entries
/// that can plausibly occur inside running text.
Map<String, String> glossaryTermMap(Map<String, String> texts) {
  final Map<String, String> terms = {};
  for (final key in texts.keys) {
    if (!key.startsWith('term_') || !key.endsWith('_t')) continue;
    final String base = key.substring(0, key.length - 2);
    final String title = texts[key]!;
    final String? description = texts['${base}_d'];
    if (title.length >= 4 && !title.contains('/') && description != null) {
      terms[title] = description;
    }
  }
  return terms;
}

bool _isLetter(String character) =>
    RegExp('[A-Za-zÇĞİÖŞÜçğıöşü]').hasMatch(character);

bool _isTermBoundary(String text, int start, int length) {
  final bool hasBefore = start > 0;
  final bool hasAfter = start + length < text.length;
  final bool okBefore = !hasBefore || !_isLetter(text[start - 1]);
  final bool okAfter = !hasAfter || !_isLetter(text[start + length]);
  return okBefore && okAfter;
}

/// Splits [text] into plain and glossary-term segments.
///
/// Matching is case-insensitive and requires word boundaries, so the
/// term "Stratigraphy" links inside "the stratigraphy of" but not
/// inside "stratigraphic". When several terms match at the same spot
/// the longest wins; scanning resumes after each match.
List<TextSegment> splitTermSegments(String text, Iterable<String> terms) {
  final List<String> needles =
      terms.where((t) => t.isNotEmpty).map((t) => t.toLowerCase()).toList();
  final String lower = text.toLowerCase();
  final List<TextSegment> segments = [];

  int cursor = 0;
  while (cursor < text.length) {
    int? bestStart;
    int bestLength = 0;
    for (final needle in needles) {
      int index = lower.indexOf(needle, cursor);
      while (index != -1) {
        if (_isTermBoundary(text, index, needle.length)) {
          if (bestStart == null ||
              index < bestStart ||
              (index == bestStart && needle.length > bestLength)) {
            bestStart = index;
            bestLength = needle.length;
          }
          break;
        }
        index = lower.indexOf(needle, index + 1);
      }
    }
    if (bestStart == null) break;
    if (bestStart > cursor) {
      segments.add(TextSegment(text.substring(cursor, bestStart)));
    }
    segments.add(TextSegment(
        text.substring(bestStart, bestStart + bestLength),
        isGlossaryTerm: true));
    cursor = bestStart + bestLength;
  }
  if (cursor < text.length) {
    segments.add(TextSegment(text.substring(cursor)));
  }
  return segments;
}

/// Body text that underlines glossary terms and opens their definition
/// in a dialog when tapped.
class LinkedText extends StatefulWidget {
  final String text;
  final TextStyle? style;

  const LinkedText({super.key, required this.text, this.style});

  @override
  State<LinkedText> createState() => _LinkedTextState();
}

class _LinkedTextState extends State<LinkedText> {
  final List<TapGestureRecognizer> _recognizers = [];

  @override
  void dispose() {
    for (final recognizer in _recognizers) {
      recognizer.dispose();
    }
    super.dispose();
  }

  void _showDefinition(String term, Map<String, String> termMap) {
    final String lang = AppStateProvider.of(context).locale.languageCode;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(term),
        content: SingleChildScrollView(
          child: Text(
            termMap[term] ?? '',
            style: const TextStyle(height: 1.5),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(localizedStrings[lang]!['dialog_close']!),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = AppStateProvider.of(context);
    final texts = localizedStrings[provider.locale.languageCode]!;
    final Map<String, String> termMap = glossaryTermMap(texts);
    final List<TextSegment> segments =
        splitTermSegments(widget.text, termMap.keys);

    final TextStyle baseStyle = widget.style ??
        Theme.of(context).textTheme.bodyMedium ??
        const TextStyle(fontSize: 16);
    final Color? linkColor = Theme.of(context).iconTheme.color;

    for (final recognizer in _recognizers) {
      recognizer.dispose();
    }
    _recognizers.clear();

    final List<InlineSpan> spans = segments.map((segment) {
      if (!segment.isGlossaryTerm) {
        return TextSpan(text: segment.text);
      }
      final recognizer = TapGestureRecognizer()
        ..onTap = () => _showDefinition(segment.text, termMap);
      _recognizers.add(recognizer);
      return TextSpan(
        text: segment.text,
        style: baseStyle.copyWith(
          color: linkColor,
          fontWeight: FontWeight.w600,
          decoration: TextDecoration.underline,
          decorationColor: linkColor?.withValues(alpha: 0.4),
        ),
        recognizer: recognizer,
      );
    }).toList();

    return Text.rich(
      TextSpan(style: baseStyle, children: spans),
    );
  }
}

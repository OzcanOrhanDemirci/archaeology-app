import 'package:flutter_test/flutter_test.dart';

import 'package:archaeology_app/core/term_links.dart';

void main() {
  group('splitTermSegments', () {
    test('marks the matching run as a glossary term', () {
      final segments =
          splitTermSegments('The stratigraphy of the mound', ['Stratigraphy']);
      expect(segments, hasLength(3));
      expect(segments[0].text, 'The ');
      expect(segments[0].isGlossaryTerm, isFalse);
      expect(segments[1].text, 'stratigraphy');
      expect(segments[1].isGlossaryTerm, isTrue);
      expect(segments[2].text, ' of the mound');
    });

    test('matches case-insensitively across languages', () {
      final segments =
          splitTermSegments('Bu stratigrafi çalışmasıdır', ['Stratigrafi']);
      expect(segments.where((s) => s.isGlossaryTerm).single.text,
          'stratigrafi');
    });

    test('does not match inside longer words', () {
      final segments = splitTermSegments(
          'Its stratigraphic position is clear', ['Stratigraphy']);
      expect(segments, hasLength(1));
      expect(segments.single.isGlossaryTerm, isFalse);
    });

    test('prefers the longest term at the same position', () {
      final segments = splitTermSegments(
          'Marine regression shaped the coast',
          ['Regression', 'Marine Regression']);
      final term = segments.where((s) => s.isGlossaryTerm).single;
      expect(term.text, 'Marine regression');
    });

    test('links every occurrence', () {
      final segments =
          splitTermSegments('agora and upper agora', ['Agora']);
      expect(segments.where((s) => s.isGlossaryTerm).length, 2);
    });

    test('returns the text untouched without terms', () {
      final segments = splitTermSegments('Plain text', []);
      expect(segments.single.text, 'Plain text');
    });
  });

  group('glossaryTermMap', () {
    test('keeps usable terms and drops composite or short titles', () {
      final map = glossaryTermMap({
        'term_stratigraphy_t': 'Stratigraphy',
        'term_stratigraphy_d': 'Study of layers',
        'term_tumulus_t': 'Tumulus / Höyük',
        'term_tumulus_d': 'A mound over a grave',
        'term_stoa_t': 'Stoa',
        'term_stoa_d': 'A covered walkway',
      });
      expect(map['Stratigraphy'], 'Study of layers');
      expect(map.containsKey('Tumulus / Höyük'), isFalse,
          reason: 'composite titles never appear verbatim in text');
      expect(map['Stoa'], 'A covered walkway',
          reason: 'four-character titles are still linkable');
    });
  });
}

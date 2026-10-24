import 'package:flutter/material.dart';
import '../core/term_links.dart';
import '../core/utils.dart';

/// Displays an image block with a title and descriptive text.
/// Blocks without an image render a decorative rule instead.
class SiteContentBlock extends StatelessWidget {
  final GlobalKey? blockKey;
  final String? imagePath;
  final String title;
  final String text;

  const SiteContentBlock({
    super.key,
    this.blockKey,
    this.imagePath,
    required this.title,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final Color themeColor = Theme.of(context).iconTheme.color!;
    return Padding(
      key: blockKey,
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (imagePath != null) ...[
            GestureDetector(
              onTap: () => showFullImage(context, imagePath!),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.asset(
                  imagePath!,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 24),
          ] else ...[
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(child: Divider(color: themeColor.withValues(alpha: 0.4))),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Icon(Icons.location_on_outlined, size: 20, color: themeColor.withValues(alpha: 0.8)),
                ),
                Expanded(child: Divider(color: themeColor.withValues(alpha: 0.4))),
              ],
            ),
            const SizedBox(height: 24),
          ],
          Text(
            title,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          LinkedText(
            text: text,
            style: const TextStyle(fontSize: 16, height: 1.5),
          ),
        ],
      ),
    );
  }
}

/// Displays an analysis section with bold header support.
class AnalysisSection extends StatelessWidget {
  final String title;
  final List<Map<String, String?>> paragraphs;

  const AnalysisSection({
    super.key,
    required this.title,
    required this.paragraphs,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        ...paragraphs.map((para) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: 16,
                  height: 1.6,
                  color: Theme.of(context).textTheme.bodyMedium?.color,
                ),
                children: [
                  if (para['bold'] != null)
                    TextSpan(
                      text: para['bold'],
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  if (para['text'] != null) TextSpan(text: para['text']),
                ],
              ),
            ),
          );
        }),
        const SizedBox(height: 12),
      ],
    );
  }
}
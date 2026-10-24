import 'package:flutter/material.dart';

/// Picks the timeline entry matching the content on screen.
///
/// [blockTops] lists the vertical offsets of the blocks in timeline
/// order; entries without a block pass [double.infinity] and are
/// skipped. The winner is the last block whose top edge sits above
/// [viewportCenter]. Returns 0 when no block qualifies yet.
int selectTimelineIndex(List<double> blockTops, double viewportCenter) {
  int selected = -1;
  for (int i = 0; i < blockTops.length; i++) {
    if (blockTops[i] <= viewportCenter) {
      selected = i;
    }
  }
  return selected < 0 ? 0 : selected;
}

/// Displays a zoomable full-screen image dialog.
void showFullImage(BuildContext context, String imagePath) {
  showDialog(
    context: context,
    builder: (context) => Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.zero,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: InteractiveViewer(
              panEnabled: true,
              minScale: 0.5,
              maxScale: 4.0,
              child: Image.asset(
                imagePath,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Positioned(
            top: 50,
            right: 20,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.5),
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: const Icon(Icons.close, color: Colors.white, size: 30),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
import 'package:flutter/material.dart';
import '../core/models.dart';

class HorizontalTimeline extends StatefulWidget {
  final List<TimelineEntry> entries;
  final int selectedIndex;
  final ValueChanged<int> onItemTap;

  const HorizontalTimeline({
    super.key,
    required this.entries,
    required this.selectedIndex,
    required this.onItemTap,
  });

  @override
  State<HorizontalTimeline> createState() => _HorizontalTimelineState();
}

class _HorizontalTimelineState extends State<HorizontalTimeline> {
  final List<GlobalKey> _chipKeys = [];

  @override
  void initState() {
    super.initState();
    _syncChipKeys();
  }

  @override
  void didUpdateWidget(covariant HorizontalTimeline oldWidget) {
    super.didUpdateWidget(oldWidget);
    _syncChipKeys();
    if (widget.selectedIndex != oldWidget.selectedIndex) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _bringSelectedChipIntoView();
      });
    }
  }

  void _syncChipKeys() {
    while (_chipKeys.length < widget.entries.length) {
      _chipKeys.add(GlobalKey());
    }
    while (_chipKeys.length > widget.entries.length) {
      _chipKeys.removeLast();
    }
  }

  /// Keeps the selected dot visible when the selection changes from
  /// content scrolling rather than a tap on the timeline itself.
  void _bringSelectedChipIntoView() {
    final int index = widget.selectedIndex;
    if (index < 0 || index >= _chipKeys.length) return;
    final BuildContext? chipContext = _chipKeys[index].currentContext;
    if (chipContext == null || !mounted) return;
    Scrollable.ensureVisible(
      chipContext,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<TimelineEntry> entries = widget.entries;
    final Color themeColor = Theme.of(context).iconTheme.color!;
    final Color lineColor = Theme.of(context).dividerColor;

    return Container(
      height: 70,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        border: Border(bottom: BorderSide(color: lineColor, width: 0.5)),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          children: List.generate(entries.length * 2 - 1, (index) {
            if (index.isEven) {
              final entryIndex = index ~/ 2;
              final entry = entries[entryIndex];
              final bool isYearZero = entry.isYearZero;
              final bool isSelected = entryIndex == widget.selectedIndex;
              final bool isClickable = entry.key != null;

              return GestureDetector(
                key: _chipKeys[entryIndex],
                onTap: isClickable
                    ? () {
                  widget.onItemTap(entryIndex);
                  if (entry.key?.currentContext != null) {
                    Scrollable.ensureVisible(
                      entry.key!.currentContext!,
                      duration: const Duration(milliseconds: 800),
                      curve: Curves.easeInOut,
                    );
                  }
                }
                    : null,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (isYearZero)
                      Text(
                        "0",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: themeColor),
                      )
                    else
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        width: isSelected ? 16 : 12,
                        height: isSelected ? 16 : 12,
                        decoration: BoxDecoration(
                          color: isSelected ? themeColor : Colors.transparent,
                          shape: BoxShape.circle,
                          border: Border.all(color: themeColor, width: 2),
                        ),
                      ),
                    const SizedBox(height: 8),
                    Text(
                      entry.label,
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight:
                        isSelected ? FontWeight.bold : FontWeight.normal,
                        color: isSelected
                            ? themeColor
                            : themeColor.withAlpha(180),
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return Container(
                width: 30,
                height: 2,
                margin: const EdgeInsets.only(bottom: 14),
                color: lineColor,
              );
            }
          }),
        ),
      ),
    );
  }
}

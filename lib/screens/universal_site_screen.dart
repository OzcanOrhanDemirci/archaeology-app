import 'dart:async';

import 'package:flutter/material.dart';
import '../state/state.dart';
import '../core/models.dart';
import '../core/utils.dart';
import '../data/site_registry.dart';
import '../widgets/timeline.dart';
import '../widgets/site_widgets.dart';
import '../widgets/app_drawer.dart';
import '../widgets/app_bar.dart';

class UniversalSiteScreen extends StatefulWidget {
  final String siteId;

  const UniversalSiteScreen({super.key, required this.siteId});

  @override
  State<UniversalSiteScreen> createState() => _UniversalSiteScreenState();
}

class _UniversalSiteScreenState extends State<UniversalSiteScreen> {
  int _currentTimelineIndex = 0;
  final Map<String, GlobalKey> _blockKeys = {};
  Timer? _programmaticScrollGuard;

  @override
  void dispose() {
    _programmaticScrollGuard?.cancel();
    super.dispose();
  }

  GlobalKey _getKeyForId(String id) {
    if (!_blockKeys.containsKey(id)) {
      _blockKeys[id] = GlobalKey();
    }
    return _blockKeys[id]!;
  }

  Widget _buildContent(BuildContext context, SiteContent content) {
    if (content is ContentBlockModel) {
      return SiteContentBlock(
        blockKey: _getKeyForId(content.id),
        imagePath: content.imagePath,
        title: content.title,
        text: content.text,
      );
    } else if (content is AnalysisSectionModel) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (content.mainImage != null) ...[
            GestureDetector(
              onTap: () => showFullImage(context, content.mainImage!),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.asset(
                  content.mainImage!,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
          Text(
            content.title,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
          ),
          if (content.abstractText != null) ...[
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(color: Theme.of(context).dividerColor),
              ),
              child: Text(
                content.abstractText!,
                style: const TextStyle(
                    fontSize: 16, fontStyle: FontStyle.italic, height: 1.5),
              ),
            ),
          ],
          const SizedBox(height: 24),
          ...content.paragraphs.map((p) => AnalysisSection(
            title: p.title,
            paragraphs: p.content,
          )),
        ],
      );
    }
    return const SizedBox.shrink();
  }

  @override
  Widget build(BuildContext context) {
    final provider = AppStateProvider.of(context);
    final String lang = provider.locale.languageCode;


    final siteData = getSiteDataById(widget.siteId, lang);
    final bool hasTabs = siteData.sections.length > 1;

    final timelineEntries = siteData.timeline.map((tData) {
      return TimelineEntry(
        label: tData.label,
        isYearZero: tData.isYearZero,
        key: tData.targetBlockId != null
            ? _getKeyForId(tData.targetBlockId!)
            : null,
      );
    }).toList();


    Widget buildTimeline() {
      return HorizontalTimeline(
        entries: timelineEntries,
        selectedIndex: _currentTimelineIndex,
        onItemTap: (index) {
          setState(() {
            _currentTimelineIndex = index;
          });
          // Suppress scroll-driven selection while ensureVisible animates
          // to the tapped block, so intermediate blocks do not flicker
          // the selection.
          _programmaticScrollGuard?.cancel();
          _programmaticScrollGuard =
              Timer(const Duration(milliseconds: 850), () {});
        },
      );
    }

    /// Updates the selected timeline entry from the scroll position:
    /// the last block whose top edge is above the viewport center wins.
    bool onContentScroll(ScrollNotification notification) {
      if (_programmaticScrollGuard?.isActive ?? false) return false;
      if (notification is! ScrollUpdateNotification &&
          notification is! ScrollEndNotification) {
        return false;
      }
      final RenderBox? viewportBox =
          notification.context?.findRenderObject() as RenderBox?;
      if (viewportBox == null || !viewportBox.attached) return false;
      final double centerDy = viewportBox
          .localToGlobal(Offset(0, viewportBox.size.height / 2))
          .dy;

      final List<double> tops = timelineEntries.map((entry) {
        final RenderBox? box =
            entry.key?.currentContext?.findRenderObject() as RenderBox?;
        if (box == null || !box.attached) return double.infinity;
        return box.localToGlobal(Offset.zero).dy;
      }).toList();

      final int newIndex = selectTimelineIndex(tops, centerDy);
      if (newIndex != _currentTimelineIndex) {
        setState(() => _currentTimelineIndex = newIndex);
      }
      return false;
    }

    Widget withScrollSync(Widget scrollableContent) {
      return NotificationListener<ScrollNotification>(
        onNotification: onContentScroll,
        child: scrollableContent,
      );
    }


    Widget buildBodyContent() {
      if (hasTabs) {
        return TabBarView(
          children: siteData.sections.map((section) {
            final int sectionIndex = siteData.sections.indexOf(section);

            final bool isGeneralInfo = sectionIndex == 0;

            final contentWidget = SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (isGeneralInfo) ...[
                    Text(
                      siteData.title,
                      style: const TextStyle(
                          fontSize: 28, fontWeight: FontWeight.w900),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      siteData.introText,
                      style: const TextStyle(fontSize: 16, height: 1.5),
                    ),
                    const SizedBox(height: 24),
                  ],
                  ...section.content.map((c) => _buildContent(context, c)),
                  const SizedBox(height: 40),
                ],
              ),
            );

            if (isGeneralInfo) {
              return Column(
                children: [
                  buildTimeline(),
                  Expanded(child: withScrollSync(contentWidget)),
                ],
              );
            } else {
              return contentWidget;
            }
          }).toList(),
        );
      } else {

        final section = siteData.sections.first;
        return Column(
          children: [
            buildTimeline(),
            Expanded(
              child: withScrollSync(
                SingleChildScrollView(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      siteData.title,
                      style: const TextStyle(
                          fontSize: 28, fontWeight: FontWeight.w900),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      siteData.introText,
                      style: const TextStyle(fontSize: 16, height: 1.5),
                    ),
                    const SizedBox(height: 24),
                    ...section.content.map((c) => _buildContent(context, c)),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
              ),
            ),
          ],
        );
      }
    }

    return DefaultTabController(
      length: siteData.sections.length,
      child: Scaffold(
        appBar: AppAppBar(
          title: siteData.title,
          bottom: hasTabs
              ? TabBar(
            isScrollable: true,
            indicatorColor: Theme.of(context).iconTheme.color,
            labelColor: Theme.of(context).appBarTheme.foregroundColor,
            unselectedLabelColor: Theme.of(context)
                .appBarTheme
                .foregroundColor
                ?.withValues(alpha: 0.6),
            tabs: siteData.sections
                .map((s) => Tab(text: s.title))
                .toList(),
          )
              : null,
        ),

        drawer: const AppDrawer(),
        body: buildBodyContent(),
      ),
    );
  }
}
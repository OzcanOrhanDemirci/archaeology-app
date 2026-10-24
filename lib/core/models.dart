import 'package:flutter/material.dart';

// --- ENUMS ---
enum AppThemeFlavor {
  turquoiseGray,
  softDenim,
  sageGreen,
  amberForest,
  crimsonSilver,
  oceanBlue,
  earthBlue,
  imperialPurple,
}

// --- CONTENT MODELS ---

/// Base class for any content inside a site page.
abstract class SiteContent {}

/// Represents the standard image + title + text block.
/// Blocks without bundled photography render text-first.
class ContentBlockModel extends SiteContent {
  final String id;
  final String? imagePath;
  final String title;
  final String text;

  ContentBlockModel({
    required this.id,
    this.imagePath,
    required this.title,
    required this.text,
  });
}

/// Represents the complex analysis section text.
class AnalysisSectionModel extends SiteContent {
  final String title;
  final String? abstractText;
  final String? mainImage;
  final List<AnalysisParagraph> paragraphs;

  AnalysisSectionModel({
    required this.title,
    this.abstractText,
    this.mainImage,
    required this.paragraphs,
  });
}

/// Helper model for Analysis paragraphs
class AnalysisParagraph {
  final String title;
  final List<Map<String, String?>> content;

  AnalysisParagraph({required this.title, required this.content});
}

/// Represents a tab or a section in the page.
class SiteSection {
  final String title;
  final List<SiteContent> content;

  SiteSection({required this.title, required this.content});
}

/// Represents the full data for a single site.
class SiteData {
  final String id;
  final String title;
  final String introText;
  final List<TimelineData> timeline;
  final List<SiteSection> sections;

  SiteData({
    required this.id,
    required this.title,
    required this.introText,
    required this.timeline,
    required this.sections,
  });
}


class TimelineData {
  final String label;
  final String? targetBlockId;
  final bool isYearZero;

  TimelineData({required this.label, this.targetBlockId, this.isYearZero = false});
}


class TimelineEntry {
  final String label;
  final GlobalKey? key;
  final bool isYearZero;
  TimelineEntry({required this.label, this.key, this.isYearZero = false});
}
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

import 'package:archaeology_app/core/models.dart';
import 'package:archaeology_app/data/localization.dart';
import 'package:archaeology_app/data/site_registry.dart';
import 'package:archaeology_app/data/sites.dart';

/// Guards the offline content bundle against drift: every listed site must
/// have a registry entry, localized strings for both languages, valid
/// timeline references, and image files that actually exist on disk.
void main() {
  final List<String> siteIds = globalSiteData.map((m) => m.id).toList();

  test('site metadata and registry cover exactly the same sites', () {
    expect(siteIds, hasLength(30));
    expect(siteIds.toSet(), equals(siteRegistry.keys.toSet()));
  });

  test('every site has localized name, subtitle and description', () {
    for (final lang in const ['en', 'tr']) {
      final texts = localizedStrings[lang]!;
      for (final meta in globalSiteData) {
        for (final key in [meta.nameKey, meta.subtitleKey, meta.descKey]) {
          final value = texts[key];
          expect(value, isNotNull,
              reason: '$lang is missing $key for ${meta.id}');
          expect(value, isNotEmpty,
              reason: '$lang has an empty $key for ${meta.id}');
        }
      }
    }
  });

  test('every site belongs to a known, localized region', () {
    const knownRegions = {'marmara', 'aegean', 'mediterranean', 'central', 'east', 'seast'};
    for (final lang in const ['en', 'tr']) {
      final texts = localizedStrings[lang]!;
      for (final meta in globalSiteData) {
        expect(knownRegions, contains(meta.regionKey),
            reason: '${meta.id} has unknown region ${meta.regionKey}');
        expect(texts['region_${meta.regionKey}'], isNotNull,
            reason: '$lang lacks a label for region ${meta.regionKey}');
      }
    }
  });

  test('english and turkish define the same non-empty string keys', () {
    final en = localizedStrings['en']!;
    final tr = localizedStrings['tr']!;
    expect(tr.keys.toSet(), equals(en.keys.toSet()));
    for (final key in en.keys) {
      expect(en[key], isNotEmpty, reason: 'en[$key] is empty');
      expect(tr[key], isNotEmpty, reason: 'tr[$key] is empty');
    }
  });

  for (final lang in const ['en', 'tr']) {
    test('site data for $lang is complete and self-consistent', () {
      for (final id in siteIds) {
        final site = getSiteDataById(id, lang);
        expect(site.id, id, reason: '$lang: wrong id for $id');
        expect(site.title, isNotEmpty, reason: '$lang: $id has no title');
        expect(site.introText, isNotEmpty, reason: '$lang: $id has no intro');
        expect(site.timeline, isNotEmpty, reason: '$lang: $id has no timeline');
        expect(site.sections, isNotEmpty, reason: '$lang: $id has no sections');

        final blockIds = <String>{};
        for (final section in site.sections) {
          expect(section.title, isNotEmpty,
              reason: '$lang: $id has an untitled section');
          for (final content in section.content) {
            if (content is ContentBlockModel) {
              expect(blockIds.add(content.id), isTrue,
                  reason: '$lang: $id repeats block id ${content.id}');
            }
          }
        }

        for (final entry in site.timeline) {
          expect(entry.label, isNotEmpty,
              reason: '$lang: $id has an untitled timeline entry');
          if (entry.targetBlockId != null) {
            expect(blockIds, contains(entry.targetBlockId),
                reason: '$lang: $id timeline points at missing block');
          }
        }
      }
    });

    test('every image referenced by $lang content exists as a bundled asset',
        () {
      final missing = <String>{};
      for (final id in siteIds) {
        final site = getSiteDataById(id, lang);
        for (final section in site.sections) {
          for (final content in section.content) {
            if (content is ContentBlockModel) {
              final image = content.imagePath;
              if (image != null && !File(image).existsSync()) {
                missing.add(image);
              }
            } else if (content is AnalysisSectionModel) {
              final image = content.mainImage;
              if (image != null && !File(image).existsSync()) {
                missing.add(image);
              }
            }
          }
        }
      }
      expect(missing, isEmpty, reason: 'missing asset files: $missing');
    });
  }
}

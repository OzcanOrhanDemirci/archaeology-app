import 'package:flutter/material.dart';

/// Metadata for archaeological sites used in listings, search and filters.
/// Maps ids to localization keys; icons live here so adding a site only
/// touches this list, the registry and localization.
class SiteMeta {
  final String id;
  final String nameKey;
  final String subtitleKey;
  final String descKey;
  final IconData icon;

  const SiteMeta({
    required this.id,
    required this.nameKey,
    required this.subtitleKey,
    required this.descKey,
    required this.icon,
  });
}

const List<SiteMeta> globalSiteData = [
  SiteMeta(id: 'ephesus', nameKey: 'site_ephesus_name', subtitleKey: 'site_ephesus_sub', descKey: 'site_ephesus_desc', icon: Icons.account_balance),
  SiteMeta(id: 'pergamon', nameKey: 'site_pergamon_name', subtitleKey: 'site_pergamon_sub', descKey: 'site_pergamon_desc', icon: Icons.terrain),
  SiteMeta(id: 'troy', nameKey: 'site_troy_name', subtitleKey: 'site_troy_sub', descKey: 'site_troy_desc', icon: Icons.shield),
  SiteMeta(id: 'hierapolis', nameKey: 'site_hierapolis_name', subtitleKey: 'site_hierapolis_sub', descKey: 'site_hierapolis_desc', icon: Icons.pool),
  SiteMeta(id: 'aspendos', nameKey: 'site_aspendos_name', subtitleKey: 'site_aspendos_sub', descKey: 'site_aspendos_desc', icon: Icons.stadium),
  SiteMeta(id: 'perge', nameKey: 'site_perge_name', subtitleKey: 'site_perge_sub', descKey: 'site_perge_desc', icon: Icons.accessibility_new),
  SiteMeta(id: 'aphrodisias', nameKey: 'site_aphrodisias_name', subtitleKey: 'site_aphrodisias_sub', descKey: 'site_aphrodisias_desc', icon: Icons.favorite),
  SiteMeta(id: 'hattusa', nameKey: 'site_hattusa_name', subtitleKey: 'site_hattusa_sub', descKey: 'site_hattusa_desc', icon: Icons.castle),
  SiteMeta(id: 'nemrut', nameKey: 'site_nemrut_name', subtitleKey: 'site_nemrut_sub', descKey: 'site_nemrut_desc', icon: Icons.landscape),
  SiteMeta(id: 'xanthos', nameKey: 'site_xanthos_name', subtitleKey: 'site_xanthos_sub', descKey: 'site_xanthos_desc', icon: Icons.foundation),
  SiteMeta(id: 'miletus', nameKey: 'site_miletus_name', subtitleKey: 'site_miletus_sub', descKey: 'site_miletus_desc', icon: Icons.grid_on),
  SiteMeta(id: 'gobeklitepe', nameKey: 'site_gobeklitepe_name', subtitleKey: 'site_gobeklitepe_sub', descKey: 'site_gobeklitepe_desc', icon: Icons.wb_sunny),
  SiteMeta(id: 'priene', nameKey: 'site_priene_name', subtitleKey: 'site_priene_sub', descKey: 'site_priene_desc', icon: Icons.grid_4x4),
  SiteMeta(id: 'sagalassos', nameKey: 'site_sagalassos_name', subtitleKey: 'site_sagalassos_sub', descKey: 'site_sagalassos_desc', icon: Icons.cloud),
  SiteMeta(id: 'side', nameKey: 'site_side_name', subtitleKey: 'site_side_sub', descKey: 'site_side_desc', icon: Icons.anchor),
  SiteMeta(id: 'didyma', nameKey: 'site_didyma_name', subtitleKey: 'site_didyma_sub', descKey: 'site_didyma_desc', icon: Icons.visibility),
  SiteMeta(id: 'sardis', nameKey: 'site_sardis_name', subtitleKey: 'site_sardis_sub', descKey: 'site_sardis_desc', icon: Icons.monetization_on),
  SiteMeta(id: 'kaunos', nameKey: 'site_kaunos_name', subtitleKey: 'site_kaunos_sub', descKey: 'site_kaunos_desc', icon: Icons.bedtime),
  SiteMeta(id: 'myra', nameKey: 'site_myra_name', subtitleKey: 'site_myra_sub', descKey: 'site_myra_desc', icon: Icons.card_giftcard),
  SiteMeta(id: 'laodicea', nameKey: 'site_laodicea_name', subtitleKey: 'site_laodicea_sub', descKey: 'site_laodicea_desc', icon: Icons.bolt),
  SiteMeta(id: 'termessos', nameKey: 'site_termessos_name', subtitleKey: 'site_termessos_sub', descKey: 'site_termessos_desc', icon: Icons.terrain),
];

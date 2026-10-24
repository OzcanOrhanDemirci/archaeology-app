import 'package:flutter/material.dart';
import '../state/state.dart';
import '../data/localization.dart';
import '../widgets/app_drawer.dart';
import '../widgets/app_bar.dart';

class GlossaryScreen extends StatelessWidget {
  const GlossaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = AppStateProvider.of(context);
    final String lang = provider.locale.languageCode;
    final texts = localizedStrings[lang]!;

    // Strip the "_t" suffix without touching matching substrings inside
    // the key itself (e.g. "term_tumulus_t" contains "_t" twice).
    final terms = texts.keys.where((k) => k.startsWith('term_') && k.endsWith('_t')).map((k) => k.substring(0, k.length - 2)).where((baseKey) => texts.containsKey('${baseKey}_t') && texts.containsKey('${baseKey}_d') && texts['${baseKey}_t']!.isNotEmpty).toList();
    final periods = texts.keys.where((k) => k.startsWith('period_') && k.endsWith('_t')).map((k) => k.substring(0, k.length - 2)).where((baseKey) => texts.containsKey('${baseKey}_t') && texts.containsKey('${baseKey}_d') && texts['${baseKey}_t']!.isNotEmpty).toList();

    final Color activeColor = Theme.of(context).iconTheme.color!;
    final Color tabLabelColor = Theme.of(context).appBarTheme.foregroundColor ?? Colors.white;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppAppBar(
          title: texts['glossary_appbar']!,
          bottom: TabBar(
            indicatorColor: activeColor,
            labelColor: tabLabelColor,
            unselectedLabelColor: tabLabelColor.withValues(alpha: 0.6),
            tabs: [Tab(text: texts['glossary_tab_terms']), Tab(text: texts['glossary_tab_periods'])],
          ),
        ),
        drawer: const AppDrawer(),
        body: TabBarView(
          children: [
            ListView.builder(padding: const EdgeInsets.all(16), itemCount: terms.length, itemBuilder: (context, index) => _buildGlossaryCard(context, texts, terms[index])),
            ListView.builder(padding: const EdgeInsets.all(16), itemCount: periods.length, itemBuilder: (context, index) => _buildGlossaryCard(context, texts, periods[index])),
          ],
        ),
      ),
    );
  }

  Widget _buildGlossaryCard(BuildContext context, Map<String, String> texts, String baseKey) {
    final Color titleColor = Theme.of(context).iconTheme.color!;
    final Color bodyColor = Theme.of(context).textTheme.bodyMedium?.color ?? Colors.black;
    final String title = texts['${baseKey}_t']!;
    final String description = texts['${baseKey}_d']!;

    return Card(
      color: Theme.of(context).cardColor,
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: titleColor)),
            const SizedBox(height: 8),
            Text(description, style: TextStyle(fontSize: 15, height: 1.5, color: bodyColor.withValues(alpha: 0.9))),
          ],
        ),
      ),
    );
  }
}
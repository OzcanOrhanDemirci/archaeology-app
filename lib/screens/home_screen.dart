import 'package:flutter/material.dart';
import '../state/state.dart';
import '../data/localization.dart';
import '../data/sites.dart';
import '../widgets/app_clickable.dart';
import '../widgets/app_drawer.dart';
import 'universal_site_screen.dart';
import 'favorites_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _searchQuery = '';
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  String _normalizeText(String text) {
    return text.toLowerCase()
        .replaceAll('ö', 'o').replaceAll('ü', 'u').replaceAll('ç', 'c')
        .replaceAll('ş', 's').replaceAll('ğ', 'g').replaceAll('ı', 'i').replaceAll('İ', 'i');
  }

  @override
  Widget build(BuildContext context) {
    final provider = AppStateProvider.of(context);
    final String lang = provider.locale.languageCode;
    final List<String> favoriteIds = provider.favoriteSiteIds;

    final filteredSites = globalSiteData.where((site) {
      final texts = localizedStrings[lang]!;
      final query = _normalizeText(_searchQuery);
      final name = _normalizeText(texts[site.nameKey]!);
      final desc = _normalizeText(texts[site.descKey]!);
      return name.contains(query) || desc.contains(query);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: const BackButton(),
        title: Text(localizedStrings[lang]!['home_title']!),
        actions: [
          TextButton(
            onPressed: provider.toggleLocale,
            style: TextButton.styleFrom(foregroundColor: Theme.of(context).appBarTheme.foregroundColor),
            child: Text(lang == 'en' ? 'TR' : 'EN', style: const TextStyle(fontWeight: FontWeight.bold)),
          ),
          IconButton(
            icon: Icon(provider.themeMode == ThemeMode.light ? Icons.dark_mode : Icons.light_mode),
            onPressed: provider.toggleTheme,
          ),
          Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
        ],
      ),
      drawer: const AppDrawer(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: localizedStrings[lang]!['search_hint']!,
                prefixIcon: Icon(Icons.search, color: Theme.of(context).iconTheme.color),
                suffixIcon: IconButton(
                  icon: Icon(Icons.bookmark_add_outlined, color: Theme.of(context).iconTheme.color),
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const FavoritesScreen())),
                ),
                filled: true,
                fillColor: Theme.of(context).cardColor,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0), borderSide: BorderSide.none),
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
              ),
              onChanged: (value) => setState(() => _searchQuery = value),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredSites.length,
              itemBuilder: (context, index) {
                final site = filteredSites[index];
                final bool isFavorite = favoriteIds.contains(site.id);
                final String siteName = localizedStrings[lang]![site.nameKey]!;
                final String siteSubtitle = localizedStrings[lang]![site.subtitleKey]!;

                return AppClickable(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => UniversalSiteScreen(siteId: site.id))),
                  child: Card(
                    color: Theme.of(context).cardColor,
                    margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                    child: ListTile(
                      enabled: false,
                      leading: Icon(site.icon, size: 32, color: Theme.of(context).iconTheme.color),
                      title: Text(siteName, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Theme.of(context).textTheme.bodyLarge?.color)),
                      subtitle: Text(siteSubtitle, style: TextStyle(fontSize: 14, color: Theme.of(context).textTheme.bodyMedium?.color)),
                      trailing: IconButton(
                        icon: Icon(isFavorite ? Icons.bookmark_added : Icons.bookmark_add_outlined, color: isFavorite ? Theme.of(context).iconTheme.color : Colors.grey),
                        onPressed: () => provider.toggleFavorite(site.id),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
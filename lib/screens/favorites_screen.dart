import 'package:flutter/material.dart';
import '../state/state.dart';
import '../data/localization.dart';
import '../data/sites.dart';
import '../widgets/app_clickable.dart';
import '../widgets/app_drawer.dart';
import 'universal_site_screen.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = AppStateProvider.of(context);
    final String lang = provider.locale.languageCode;
    final List<String> favoriteIds = provider.favoriteSiteIds;

    final favoriteSites = globalSiteData
        .where((site) => favoriteIds.contains(site.id))
        .toList();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: const BackButton(),
        title: Text(localizedStrings[lang]!['favorites_appbar']!),
        actions: [
          TextButton(
            onPressed: provider.toggleLocale,
            style: TextButton.styleFrom(
              foregroundColor: Theme.of(context).appBarTheme.foregroundColor,
            ),
            child: Text(
              lang == 'en' ? 'TR' : 'EN',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          IconButton(
            icon: Icon(
              provider.themeMode == ThemeMode.light
                  ? Icons.dark_mode
                  : Icons.light_mode,
            ),
            onPressed: provider.toggleTheme,
            tooltip: localizedStrings[lang]!['tooltip_theme']!,
          ),
          Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.menu),
              tooltip: localizedStrings[lang]!['tooltip_menu'],
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
        ],
      ),
      drawer: const AppDrawer(),
      body: favoriteSites.isEmpty
          ? Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Text(
            localizedStrings[lang]!['favorites_empty']!,
            style: const TextStyle(fontSize: 18, color: Colors.grey),
            textAlign: TextAlign.center,
          ),
        ),
      )
          : ListView.builder(
        padding: const EdgeInsets.only(top: 16.0),
        itemCount: favoriteSites.length,
        itemBuilder: (context, index) {
          final site = favoriteSites[index];
          final bool isFavorite = favoriteIds.contains(site.id);

          return AppClickable(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UniversalSiteScreen(siteId: site.id),
                ),
              );
            },
            child: Card(
              color: Theme.of(context).cardColor,
              margin: const EdgeInsets.symmetric(
                  vertical: 8.0, horizontal: 16.0),
              elevation: 2.0,
              child: ListTile(
                enabled: false,
                leading: Icon(site.icon,
                    color: Theme.of(context).iconTheme.color),
                title: Text(
                  localizedStrings[lang]![site.nameKey]!,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Theme.of(context).textTheme.bodyLarge?.color,
                  ),
                ),
                subtitle: Text(
                  localizedStrings[lang]![site.subtitleKey]!,
                  style: TextStyle(fontSize: 14, color: Theme.of(context).textTheme.bodyMedium?.color),
                ),
                trailing: IconButton(
                  icon: Icon(
                    isFavorite
                        ? Icons.bookmark_added
                        : Icons.bookmark_add_outlined,
                    color: isFavorite
                        ? Theme.of(context).iconTheme.color
                        : Colors.grey,
                  ),
                  onPressed: () {
                    provider.toggleFavorite(site.id);
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
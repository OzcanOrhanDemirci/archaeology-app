import 'package:flutter/material.dart';
import '../data/localization.dart';
import '../state/state.dart';

/// Standard app bar shared by every screen: title, optional tab bar,
/// language toggle, theme toggle and the drawer menu button.
class AppAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool centerTitle;
  final PreferredSizeWidget? bottom;

  const AppAppBar({
    super.key,
    required this.title,
    this.centerTitle = false,
    this.bottom,
  });

  @override
  Size get preferredSize => Size.fromHeight(
      kToolbarHeight + (bottom?.preferredSize.height ?? 0.0));

  @override
  Widget build(BuildContext context) {
    final provider = AppStateProvider.of(context);
    final String lang = provider.locale.languageCode;
    final Color foreground =
        Theme.of(context).appBarTheme.foregroundColor ?? Colors.white;

    return AppBar(
      automaticallyImplyLeading: false,
      leading: const BackButton(),
      title: Text(title),
      centerTitle: centerTitle,
      bottom: bottom,
      actions: [
        TextButton(
          onPressed: provider.toggleLocale,
          style: TextButton.styleFrom(foregroundColor: foreground),
          child: Text(lang == 'en' ? 'TR' : 'EN',
              style: const TextStyle(fontWeight: FontWeight.bold)),
        ),
        IconButton(
          icon: Icon(switch (provider.themeMode) {
            ThemeMode.light => Icons.dark_mode,
            ThemeMode.dark => Icons.light_mode,
            ThemeMode.system => Icons.brightness_auto,
          }),
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
    );
  }
}

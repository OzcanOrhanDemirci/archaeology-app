import 'package:flutter/material.dart';
import '../core/models.dart';

/// InheritedWidget to provide global state to the application tree.
class AppStateProvider extends InheritedWidget {
  final Locale locale;
  final ThemeMode themeMode;
  final AppThemeFlavor themeFlavor;
  final List<String> favoriteSiteIds;
  final VoidCallback toggleLocale;
  final VoidCallback toggleTheme;
  final ValueSetter<ThemeMode> setThemeMode;
  final ValueSetter<AppThemeFlavor> setFlavor;
  final ValueSetter<String> toggleFavorite;

  const AppStateProvider({
    super.key, //
    required this.locale,
    required this.themeMode,
    required this.themeFlavor,
    required this.favoriteSiteIds,
    required this.toggleLocale,
    required this.toggleTheme,
    required this.setThemeMode,
    required this.setFlavor,
    required this.toggleFavorite,
    required super.child,
  });

  static AppStateProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppStateProvider>()!;
  }

  @override
  bool updateShouldNotify(AppStateProvider oldWidget) {
    return oldWidget.locale != locale ||
        oldWidget.themeMode != themeMode ||
        oldWidget.themeFlavor != themeFlavor ||
        oldWidget.favoriteSiteIds != favoriteSiteIds;
  }
}
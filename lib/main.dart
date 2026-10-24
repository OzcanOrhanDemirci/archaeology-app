// Developed by Özcan Orhan Demirci

// Main Application Entry Point

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/models.dart';
import 'data/localization.dart';
import 'state/state.dart';
import 'screens/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  runApp(MyApp(prefs: prefs));
}

/// Root Widget handling high-level state (Theme, Locale, Favorites)
/// and persisting it across app restarts.
class MyApp extends StatefulWidget {
  final SharedPreferences prefs;

  const MyApp({super.key, required this.prefs});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static const String _kThemeMode = 'pref_theme_mode';
  static const String _kThemeFlavor = 'pref_theme_flavor';
  static const String _kLocale = 'pref_locale';
  static const String _kFavorites = 'pref_favorites';

  late ThemeMode _themeMode;
  late AppThemeFlavor _themeFlavor;
  late Locale _locale;
  List<String> _favoriteSiteIds = [];

  @override
  void initState() {
    super.initState();
    final SharedPreferences prefs = widget.prefs;
    _themeMode = ThemeMode.values.firstWhere(
      (m) => m.name == prefs.getString(_kThemeMode),
      orElse: () => ThemeMode.dark,
    );
    _themeFlavor = AppThemeFlavor.values.firstWhere(
      (f) => f.name == prefs.getString(_kThemeFlavor),
      orElse: () => AppThemeFlavor.softDenim,
    );
    _locale = Locale(prefs.getString(_kLocale) ?? 'en');
    _favoriteSiteIds = prefs.getStringList(_kFavorites) ?? [];
  }

  void toggleTheme() {
    setState(() {
      _themeMode = switch (_themeMode) {
        ThemeMode.light => ThemeMode.dark,
        ThemeMode.dark => ThemeMode.light,
        ThemeMode.system => WidgetsBinding
                    .instance.platformDispatcher.platformBrightness ==
                Brightness.dark
            ? ThemeMode.light
            : ThemeMode.dark,
      };
      widget.prefs.setString(_kThemeMode, _themeMode.name);
    });
  }

  void setThemeMode(ThemeMode mode) {
    setState(() {
      _themeMode = mode;
      widget.prefs.setString(_kThemeMode, mode.name);
    });
  }

  void setFlavor(AppThemeFlavor flavor) {
    setState(() {
      _themeFlavor = flavor;
      widget.prefs.setString(_kThemeFlavor, flavor.name);
    });
  }

  void toggleLocale() {
    setState(() {
      _locale =
      _locale.languageCode == 'en' ? const Locale('tr') : const Locale('en');
      widget.prefs.setString(_kLocale, _locale.languageCode);
    });
  }

  void toggleFavorite(String siteId) {
    setState(() {
      final newFavorites = List<String>.from(_favoriteSiteIds);
      if (newFavorites.contains(siteId)) {
        newFavorites.remove(siteId);
      } else {
        newFavorites.add(siteId);
      }
      _favoriteSiteIds = newFavorites;
      widget.prefs.setStringList(_kFavorites, newFavorites);
    });
  }

  /// Generates a ThemeData object based on the 60-30-10 color rule.
  ThemeData _createTheme(
      bool isDark, {
        required Color primary60,
        required Color secondary30,
        required Color accent10,
        Color? lightBgOverride,
        Color? lightIconColor,
      }) {
    final Color bgColor = isDark
        ? primary60
        : (lightBgOverride ?? const Color(0xFFFAFAFA));

    final Color cardColor =
    isDark ? secondary30.withValues(alpha: 0.6) : Colors.white;


    final Color appBarColor = isDark ? primary60 : secondary30;


    final Color iconColor = isDark ? accent10 : (lightIconColor ?? secondary30);

    return ThemeData(
      brightness: isDark ? Brightness.dark : Brightness.light,
      primarySwatch: Colors.blueGrey,
      scaffoldBackgroundColor: bgColor,
      cardColor: cardColor,
      appBarTheme: AppBarTheme(
        backgroundColor: appBarColor,
        foregroundColor: Colors.white,
        titleTextStyle: const TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
      ),
      iconTheme: IconThemeData(color: iconColor),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(foregroundColor: iconColor),
      ),
      dividerColor: isDark ? Colors.white24 : Colors.black12,
      colorScheme: ColorScheme.fromSeed(
        seedColor: secondary30,
        brightness: isDark ? Brightness.dark : Brightness.light,
      ).copyWith(
        primary: secondary30,
        secondary: accent10,
      ),
    );
  }

  ThemeData _buildTheme(AppThemeFlavor flavor, Brightness brightness) {
    final bool isDark = brightness == Brightness.dark;
    switch (flavor) {
      case AppThemeFlavor.turquoiseGray:
        return _createTheme(isDark,
            primary60:
            isDark ? const Color(0xFF191F21) : const Color(0xFFF5F5F5),

            secondary30: const Color(0xFF00838F),
            accent10: const Color(0xFF62D7DD),
            lightIconColor: const Color(0xFF006064));

      case AppThemeFlavor.softDenim:
        return _createTheme(isDark,
            primary60: const Color(0xFF1D2C36),
            secondary30: const Color(0xFF8F8578),
            accent10: const Color(0xFFB9C6C8),
            lightBgOverride: const Color(0xFFECEFF1),
            lightIconColor: const Color(0xFF455A64));

      case AppThemeFlavor.sageGreen:
        return _createTheme(isDark,
            primary60: const Color(0xFF252618),
            secondary30: const Color(0xFF246637),
            accent10: const Color(0xFFBCBD8B),
            lightBgOverride: const Color(0xFFF1F8E9),
            lightIconColor: const Color(0xFF33691E));

      case AppThemeFlavor.amberForest:
        return _createTheme(isDark,
            primary60: const Color(0xFF0B1E1A),

            secondary30: const Color(0xFFEF6C00),
            accent10: const Color(0xFFF2C063),
            lightIconColor: const Color(0xFFE65100));

      case AppThemeFlavor.crimsonSilver:
        return _createTheme(isDark,
            primary60: const Color(0xFF1D1D27),
            secondary30: const Color(0xFFBF2541),
            accent10: const Color(0xFFBFBFBF),
            lightIconColor: const Color(0xFFC62828));

      case AppThemeFlavor.oceanBlue:
        return _createTheme(isDark,
            primary60: const Color(0xFF11192D),
            secondary30: const Color(0xFF283B89),
            accent10: const Color(0xFF58D8DB),
            lightIconColor: const Color(0xFF1565C0));

      case AppThemeFlavor.earthBlue:
        return _createTheme(isDark,
            primary60: const Color(0xFF1B2232),
            secondary30: const Color(0xFF7C3E2A),
            accent10: const Color(0xFF5CB5F2),
            lightIconColor: const Color(0xFF4E342E));

      case AppThemeFlavor.imperialPurple:
        return _createTheme(isDark,
            primary60: const Color(0xFF36454F),
            secondary30: const Color(0xFF66023C),
            accent10: const Color(0xFFD4AF37),
            lightIconColor: const Color(0xFF6A1B9A));
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppStateProvider(
      locale: _locale,
      themeMode: _themeMode,
      themeFlavor: _themeFlavor,
      favoriteSiteIds: _favoriteSiteIds,
      toggleLocale: toggleLocale,
      toggleTheme: toggleTheme,
      setThemeMode: setThemeMode,
      setFlavor: setFlavor,
      toggleFavorite: toggleFavorite,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: localizedStrings[_locale.languageCode]!['app_title']!,
        theme: _buildTheme(_themeFlavor, Brightness.light),
        darkTheme: _buildTheme(_themeFlavor, Brightness.dark),
        themeMode: _themeMode,
        home: const SplashScreen(),
      ),
    );
  }
}

// Developed by Özcan Orhan Demirci
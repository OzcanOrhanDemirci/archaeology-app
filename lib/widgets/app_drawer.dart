import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../state/state.dart';
import '../data/localization.dart';
import 'app_clickable.dart';
import '../screens/splash_screen.dart';
import '../screens/home_screen.dart';
import '../screens/glossary_screen.dart';
import '../screens/about_screen.dart';
import '../screens/settings_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = AppStateProvider.of(context);
    final String lang = provider.locale.languageCode;
    final texts = localizedStrings[lang]!;


    final Color iconColor = Theme.of(context).iconTheme.color!;

    return Drawer(
      child: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[

            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).appBarTheme.backgroundColor,
              ),
              // Scales the header content down on short drawers instead of
              // overflowing them.
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,

                      border: Border.all(color: iconColor.withValues(alpha: 0.5), width: 2),
                      color: iconColor.withValues(alpha: 0.1),
                    ),
                    child: ClipOval(

                      child: Transform.scale(
                        scale: 2.0,
                        child: Image.asset(
                            'assets/icon/icon_foreground.png',
                            fit: BoxFit.cover
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    texts['drawer_header']!,
                    style: TextStyle(
                      color: Theme.of(context).appBarTheme.titleTextStyle?.color,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ],
                ),
              ),
            ),

            _buildDrawerItem(
                context,
                Icons.home,
                texts['menu_title']!,
                    () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const SplashScreen()),
                        (route) => false,
                  );
                }
            ),


            _buildDrawerItem(
                context,
                Icons.location_on,
                texts['drawer_sites']!,
                    () => _navigateTo(context, const HomeScreen())
            ),


            _buildDrawerItem(
                context,
                Icons.book,
                texts['drawer_glossary']!,
                    () => _navigateTo(context, const GlossaryScreen())
            ),


            _buildDrawerItem(
                context,
                Icons.info,
                texts['drawer_about']!,
                    () => _navigateTo(context, const AboutScreen())
            ),


            _buildDrawerItem(
                context,
                Icons.settings,
                texts['drawer_settings']!,
                    () => _navigateTo(context, const SettingsScreen())
            ),

            const Divider(),


            _buildDrawerItem(
              context,
              Icons.exit_to_app,
              texts['menu_exit']!,
                  () => SystemNavigator.pop(),
              isExit: true,
            ),
          ],
        ),
      ),
    );
  }

  /// Closes the drawer and replaces every route above the splash root,
  /// keeping the navigation stack at a fixed depth no matter how many
  /// drawer items the user opens in a row.
  void _navigateTo(BuildContext context, Widget screen) {
    Navigator.pop(context);
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => screen),
      (route) => route.isFirst,
    );
  }

  Widget _buildDrawerItem(BuildContext context, IconData icon, String text, VoidCallback onTap, {bool isExit = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: AppClickable(
        onTap: onTap,
        isExit: isExit,
        borderRadius: 8,
        child: ListTile(
          enabled: false,
          minLeadingWidth: 24,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
          leading: Icon(
              icon,
              color: isExit ? Colors.red.shade400 : Theme.of(context).iconTheme.color
          ),
          title: Text(
              text,
              style: TextStyle(
                  fontSize: 16,
                  color: isExit ? Colors.red.shade400 : Theme.of(context).textTheme.bodyLarge?.color,
                  fontWeight: isExit ? FontWeight.bold : FontWeight.normal
              )
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../state/state.dart';
import '../data/localization.dart';
import '../widgets/app_clickable.dart';
import '../widgets/app_drawer.dart';
import '../widgets/app_bar.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  Future<void> _launchURL(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      debugPrint('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = AppStateProvider.of(context);
    final String lang = provider.locale.languageCode;
    final texts = localizedStrings[lang]!;

    final Color iconColor = Theme.of(context).iconTheme.color!;
    final Color textColor = Theme.of(context).textTheme.bodyLarge?.color ?? Colors.black;
    final Color dividerColor = Theme.of(context).dividerColor;
    final Color cardColor = Theme.of(context).cardColor;

    return Scaffold(
      appBar: AppAppBar(
        title: texts['about_appbar']!,
        centerTitle: true,
      ),
      drawer: const AppDrawer(),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  _buildPersonBadge(context, name: texts['about_dev_name']!, role: texts['about_dev_role']!, titleColor: iconColor),
                  const SizedBox(height: 30),
                  _buildPersonBadge(context, name: texts['about_content_name']!, role: texts['about_content_role']!, titleColor: iconColor),
                  const SizedBox(height: 40),
                  Divider(color: dividerColor, thickness: 1),
                  const SizedBox(height: 30),
                  Text(texts['about_desc']!, textAlign: TextAlign.center, style: TextStyle(fontSize: 16, height: 1.6, color: textColor.withValues(alpha: 0.9))),
                  const SizedBox(height: 16),
                  Text(
                    texts['about_update_note']!,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12, height: 1.5, color: textColor.withValues(alpha: 0.6), fontStyle: FontStyle.italic),
                  ),
                  const SizedBox(height: 30),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(color: iconColor.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(20), border: Border.all(color: iconColor.withValues(alpha: 0.3))),
                    child: Text(texts['about_version']!, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: iconColor)),
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: cardColor,
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(texts['about_legal']!, textAlign: TextAlign.center, style: TextStyle(fontSize: 11, color: textColor.withValues(alpha: 0.6), height: 1.3)),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildSocialButton(context, label: 'GitHub', icon: Icons.code, url: 'https://github.com/OzcanOrhanDemirci', itemsColor: iconColor, borderColor: dividerColor),
                    _buildSocialButton(context, label: 'LinkedIn', icon: Icons.work_outline, url: 'https://www.linkedin.com/in/ozcan-orhan-demirci/', itemsColor: iconColor, borderColor: dividerColor),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPersonBadge(BuildContext context, {required String name, required String role, required Color titleColor}) {
    return Column(children: [Text(role.toUpperCase(), style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: titleColor.withValues(alpha: 0.8), letterSpacing: 1.2)), const SizedBox(height: 8), Text(name, style: TextStyle(fontSize: 26, fontWeight: FontWeight.w900, color: Theme.of(context).textTheme.titleLarge?.color))]);
  }

  Widget _buildSocialButton(BuildContext context, {required String label, required IconData icon, required String url, required Color itemsColor, required Color borderColor}) {
    return AppClickable(
      onTap: () => _launchURL(url),
      rippleColor: itemsColor,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(border: Border.all(color: borderColor), borderRadius: BorderRadius.circular(12)),
        child: Row(children: [Icon(icon, size: 20, color: itemsColor), const SizedBox(width: 8), Text(label, style: TextStyle(fontWeight: FontWeight.bold, color: itemsColor))]),
      ),
    );
  }
}
import 'dart:async';
import 'package:flutter/material.dart';
import '../state/state.dart';
import '../data/localization.dart';
import '../core/models.dart';
import '../widgets/app_clickable.dart';
import '../widgets/app_drawer.dart';
import '../widgets/app_bar.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});
  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late DateTime _now;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _now = DateTime.now();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) { if (mounted) setState(() => _now = DateTime.now()); });
  }

  @override
  void dispose() { _timer?.cancel(); super.dispose(); }

  Widget _buildThemeOption(BuildContext context, String label, AppThemeFlavor flavor, AppThemeFlavor currentFlavor, Color previewColor) {
    final bool isSelected = flavor == currentFlavor;
    return AppClickable(
      onTap: () => AppStateProvider.of(context).setFlavor(flavor),
      borderRadius: 100,
      rippleColor: previewColor,
      child: Column(
        children: [
          Container(
            width: 60, height: 60,
            decoration: BoxDecoration(
              color: previewColor,
              shape: BoxShape.circle,
              border: isSelected ? Border.all(color: Theme.of(context).iconTheme.color!, width: 3) : Border.all(color: Colors.grey, width: 1),
              boxShadow: [if (isSelected) BoxShadow(color: Colors.black.withValues(alpha: 0.5), blurRadius: 8, offset: const Offset(0, 4))],
            ),
            child: isSelected ? const Icon(Icons.check, color: Colors.white) : null,
          ),
          const SizedBox(height: 8),
          Text(label, textAlign: TextAlign.center, style: TextStyle(fontWeight: isSelected ? FontWeight.bold : FontWeight.normal, fontSize: 11)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = AppStateProvider.of(context);
    final String lang = provider.locale.languageCode;
    final Color iconColor = Theme.of(context).iconTheme.color!;
    final String formattedTime = '${_now.hour.toString().padLeft(2, '0')}:${_now.minute.toString().padLeft(2, '0')}:${_now.second.toString().padLeft(2, '0')}';
    final String formattedDate = lang == 'tr' ? '${_now.day.toString().padLeft(2, '0')}.${_now.month.toString().padLeft(2, '0')}.${_now.year}' : '${_now.month.toString().padLeft(2, '0')}/${_now.day.toString().padLeft(2, '0')}/${_now.year}';

    return Scaffold(
      appBar: AppAppBar(title: localizedStrings[lang]!['settings_appbar']!),
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(localizedStrings[lang]!['settings_theme_title']!, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            GridView.count(shrinkWrap: true, physics: const NeverScrollableScrollPhysics(), crossAxisCount: 4, mainAxisSpacing: 16, crossAxisSpacing: 16, childAspectRatio: 0.75, children: [
              _buildThemeOption(context, localizedStrings[lang]!['theme_softDenim']!, AppThemeFlavor.softDenim, provider.themeFlavor, const Color(0xFFB9C6C8)),
              _buildThemeOption(context, localizedStrings[lang]!['theme_turquoiseGray']!, AppThemeFlavor.turquoiseGray, provider.themeFlavor, const Color(0xFF62D7DD)),
              _buildThemeOption(context, localizedStrings[lang]!['theme_sageGreen']!, AppThemeFlavor.sageGreen, provider.themeFlavor, const Color(0xFFBCBD8B)),
              _buildThemeOption(context, localizedStrings[lang]!['theme_amberForest']!, AppThemeFlavor.amberForest, provider.themeFlavor, const Color(0xFFF2C063)),
              _buildThemeOption(context, localizedStrings[lang]!['theme_crimsonSilver']!, AppThemeFlavor.crimsonSilver, provider.themeFlavor, const Color(0xFFBF2541)),
              _buildThemeOption(context, localizedStrings[lang]!['theme_oceanBlue']!, AppThemeFlavor.oceanBlue, provider.themeFlavor, const Color(0xFF58D8DB)),
              _buildThemeOption(context, localizedStrings[lang]!['theme_earthBlue']!, AppThemeFlavor.earthBlue, provider.themeFlavor, const Color(0xFF5CB5F2)),
              _buildThemeOption(context, localizedStrings[lang]!['theme_imperialPurple']!, AppThemeFlavor.imperialPurple, provider.themeFlavor, const Color(0xFF66023C)),
            ]),
            const SizedBox(height: 32),
            Divider(color: iconColor),
            const SizedBox(height: 32),
            Text(localizedStrings[lang]!['settings_datetime_title']!, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Row(children: [Icon(Icons.calendar_today, color: iconColor, size: 20), const SizedBox(width: 8), Text(formattedDate, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: iconColor))]), Row(children: [Icon(Icons.access_time, color: iconColor, size: 20), const SizedBox(width: 8), Text(formattedTime, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: iconColor))])]),
          ],
        ),
      ),
    );
  }
}
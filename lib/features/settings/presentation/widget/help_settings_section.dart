import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/constants/urls.dart';
import 'settings_section.dart';
import 'settings_tile.dart';

class HelpSettingsSection extends StatelessWidget {
  const HelpSettingsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SettingsSection(
      title: "Help",
      items: [
        SettingsTile(
          leading: Icons.forward_to_inbox,
          title: "Email",
          subtitle: "Tap here to contact over email.",
          onTap: () => launchUrl(Uri.parse("mailto:${Urls.contactEmail}")),
        ),
        SettingsTile(
          leading: Icons.description_outlined,
          title: "Terms of Service",
          onTap: () => launchUrl(Uri.parse(Urls.termsService)),
        ),
        SettingsTile(
          leading: Icons.privacy_tip_outlined,
          title: "Privacy Policy",
          onTap: () => launchUrl(Uri.parse(Urls.privacyPolicy)),
        ),
      ],
    );
  }
}

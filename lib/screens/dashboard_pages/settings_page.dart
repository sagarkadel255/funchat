import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF81EEFF), // matching dashboard background
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Settings",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Icon(Icons.settings, size: 28),
                ],
              ),
            ),

            // Content
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                ),
                child: ListView(
                  children: [
                    SettingsTile(
                      icon: Icons.person,
                      title: "Profile",
                      subtitle: "Update your personal info",
                      onTap: () {},
                    ),
                    SettingsTile(
                      icon: Icons.lock,
                      title: "Privacy",
                      subtitle: "Manage your privacy settings",
                      onTap: () {},
                    ),
                    SettingsTile(
                      icon: Icons.notifications,
                      title: "Notifications",
                      subtitle: "Manage notifications",
                      onTap: () {},
                    ),
                    SettingsTile(
                      icon: Icons.language,
                      title: "Language",
                      subtitle: "Change app language",
                      onTap: () {},
                    ),
                    SettingsTile(
                      icon: Icons.help,
                      title: "Help & Support",
                      subtitle: "FAQ, contact support",
                      onTap: () {},
                    ),
                    SettingsTile(
                      icon: Icons.logout,
                      title: "Logout",
                      subtitle: "Sign out from your account",
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SettingsTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const SettingsTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: const Color(0xFF667EEA),
          child: Icon(icon, color: Colors.white),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
}

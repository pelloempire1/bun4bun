import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../constant/color.dart';
import '../../controller/auth_controller.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final email = user?.email ?? 'Unknown user';

    final initials = (email.isNotEmpty ? email[0] : '?').toUpperCase();

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header card
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.orange[400],
              borderRadius: BorderRadius.circular(24),
            ),
            child: Row(
              children: [
                // Avatar
                Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    image: user?.photoURL != null
                        ? DecorationImage(
                            image: NetworkImage(user!.photoURL!),
                            fit: BoxFit.cover,
                          )
                        : null,
                  ),
                  child: user?.photoURL == null
                      ? Center(
                          child: Text(
                            initials,
                            style: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: dark,
                            ),
                          ),
                        )
                      : null,
                ),
                const SizedBox(width: 16),
                // Email as "name"
                Expanded(
                  child: Text(
                    email,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          const Text(
            'Settings',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),

          _SettingsTile(
            icon: Icons.color_lens_outlined,
            iconColor: Colors.blue,
            title: 'Appearance',
            subtitle: 'Make Bun4Bun yours',
            onTap: () {
              // TODO: theme options
            },
          ),
          _SettingsTile(
            icon: Icons.fingerprint,
            iconColor: Colors.red,
            title: 'Privacy',
            subtitle: 'Lock the app to improve your privacy',
            onTap: () {
              // TODO: privacy options
            },
          ),
          _SettingsTile(
            icon: Icons.dark_mode_outlined,
            iconColor: Colors.deepOrange,
            title: 'Dark mode',
            subtitle: 'Automatic',
            trailing: Switch(
              value: false,
              onChanged: (v) {
                // TODO: wire up dark mode
              },
            ),
          ),
          _SettingsTile(
            icon: Icons.info_outline,
            iconColor: Colors.purple,
            title: 'About',
            subtitle: 'Learn more about Bun4Bun',
            onTap: () {},
          ),
          _SettingsTile(
            icon: Icons.chat_bubble_outline,
            iconColor: Colors.amber,
            title: 'Send Feedback',
            subtitle: 'Tell us how we can improve',
            onTap: () {},
          ),

          const SizedBox(height: 24),
          const Text(
            'Account',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),

          _SettingsTile(
            icon: Icons.logout,
            iconColor: Colors.black87,
            title: 'Sign Out',
            subtitle: '',
            onTap: () {
              Get.find<AuthController>().logout();
            },
          ),
          _SettingsTile(
            icon: Icons.alternate_email,
            iconColor: Colors.black87,
            title: 'Change email',
            subtitle: '',
            onTap: () {
              // TODO: implement change email flow
            },
          ),
        ],
      ),
    );
  }
}

class _SettingsTile extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;

  const _SettingsTile({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.subtitle,
    this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        leading: Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: iconColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: iconColor),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: subtitle.isNotEmpty ? Text(subtitle) : null,
        trailing: trailing ??
            const Icon(
              Icons.chevron_right,
              color: Colors.grey,
            ),
        onTap: onTap,
      ),
    );
  }
}

library user_profile_drawer;

import 'package:flutter/material.dart';

class UserProfileDrawer extends StatelessWidget {
  final String name;
  final String email;
  final String? profileImageUrl;
  final Color? headerColor;
  final Color? textColor; // 🆕 text color

  const UserProfileDrawer({
    Key? key,
    required this.name,
    required this.email,
    this.profileImageUrl,
    this.headerColor,
    this.textColor, // 🆕
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color fallbackHeaderColor = headerColor ?? const Color(0xFF4e54c8);
    final Color fallbackTextColor = textColor ?? Colors.white; // 🆕

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: headerColor == null
                  ? const LinearGradient(
                      colors: [Color(0xFF4e54c8), Color(0xFF8f94fb)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    )
                  : null,
              color: headerColor,
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 6,
                  offset: Offset(0, 3),
                )
              ],
            ),
            child: UserAccountsDrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.transparent,
              ),
              accountName: Text(
                name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: fallbackTextColor, // 🆕
                ),
              ),
              accountEmail: Text(
                email,
                style: TextStyle(
                  fontSize: 14,
                  color: fallbackTextColor, // 🆕
                ),
              ),
              currentAccountPicture: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.white,
                backgroundImage: profileImageUrl != null
                    ? NetworkImage(profileImageUrl!)
                    : null,
                child: profileImageUrl == null
                    ? Text(
                        _getInitials(name),
                        style: TextStyle(
                          fontSize: 22,
                          color: fallbackHeaderColor,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    : null,
              ),
            ),
          ),

          const Divider(),
        ],
      ),
    );
  }

  static String _getInitials(String name) {
    final parts = name.trim().split(' ');
    if (parts.length == 1) return parts[0][0].toUpperCase();
    return (parts[0][0] + parts[1][0]).toUpperCase();
  }
}

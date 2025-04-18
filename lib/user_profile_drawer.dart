library user_profile_drawer;

import 'package:flutter/material.dart';

class UserProfileDrawer extends StatelessWidget {
  final String name;
  final String email;
  final String? profileImageUrl;

  const UserProfileDrawer({
    Key? key,
    required this.name,
    required this.email,
    this.profileImageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF4e54c8), Color(0xFF8f94fb)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 6,
                  offset: Offset(0, 3),
                )
              ],
            ),
            child: UserAccountsDrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.transparent, // So gradient shows
              ),
              accountName: Text(
                name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              accountEmail: Text(
                email,
                style: const TextStyle(fontSize: 14),
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
                        style: const TextStyle(
                          fontSize: 22,
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    : null,
              ),
            ),
          ),

          const Divider(),

          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text("Settings"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text("Logout"),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  static String _getInitials(String name) {
    final parts = name.trim().split(' ');
    if (parts.length == 1) return parts[0][0];
    return parts[0][0] + parts[1][0];
  }
}

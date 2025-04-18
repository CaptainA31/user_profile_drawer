library user_profile_drawer;

import 'package:flutter/material.dart';

class UserProfileDrawer extends StatelessWidget {
  final String name;
  final String email;
  final String? profileImageUrl;
  final List<Widget>? drawerItems;

  const UserProfileDrawer({
    Key? key,
    required this.name,
    required this.email,
    this.profileImageUrl,
    this.drawerItems,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(name),
            accountEmail: Text(email),
            currentAccountPicture: CircleAvatar(
              backgroundImage: profileImageUrl != null
                  ? NetworkImage(profileImageUrl!)
                  : null,
              child: profileImageUrl == null
                  ? Text(
                      name.isNotEmpty ? name[0].toUpperCase() : '?',
                      style: const TextStyle(fontSize: 24, color: Colors.white),
                    )
                  : null,
              backgroundColor: Colors.blueGrey,
            ),
          ),
          ...(drawerItems ?? []),
        ],
      ),
    );
  }
}

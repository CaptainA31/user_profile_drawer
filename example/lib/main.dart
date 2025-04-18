import 'package:flutter/material.dart';
import 'package:user_profile_drawer/user_profile_drawer.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Profile Drawer Demo')),
        drawer: UserProfileDrawer(
          name: "Muhammad Anas",
          email: "Anas@example.com",
          profileImageUrl: "https://cdn.prod.website-files.com/62d84e447b4f9e7263d31e94/6399a4d27711a5ad2c9bf5cd_ben-sweet-2LowviVHZ-E-unsplash-1.jpeg",
          headerColor: Colors.yellow,
          textColor: Colors.black, // ✅ makes it readable on yellow
        ),



        body: const Center(child: Text("Swipe from the left!")),
      ),
    );
  }
}

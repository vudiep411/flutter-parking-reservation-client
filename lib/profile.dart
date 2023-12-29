import 'package:flutter/material.dart';
import './components/appbar.dart';
import 'package:provider/provider.dart';
import 'provider.dart';
import './components/bottom_navbar.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Profile"),
      ), // And the BottomNavbar here if needed
    );
  }
}

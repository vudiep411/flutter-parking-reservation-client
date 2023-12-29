import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider.dart';
import './components/appbar.dart';
import './components/bottom_navbar.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Home"),
      ), // And the BottomNavbar here if needed
    );
  }
}

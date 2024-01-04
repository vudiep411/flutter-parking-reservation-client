import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/provider.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return AppBar(
      backgroundColor: userProvider.currentBrightness == Brightness.light
          ? Colors.white
          : Colors.black,
      title: Text(
        'Parking Reserve',
        style: TextStyle(fontSize: 16.0, color: userProvider.textColor),
      ),
      elevation: 1,
      shadowColor: const Color.fromARGB(255, 66, 71, 73),
      actions: [
        IconButton(
          icon: const Icon(Icons.lightbulb_outline),
          onPressed: () {
            userProvider.setBrightness();
          },
        ),
      ],
    );
  }
}

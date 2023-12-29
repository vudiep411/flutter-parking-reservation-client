import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider.dart';
import '../profile.dart';

class BottomNavbar extends StatelessWidget {
  const BottomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          label: "Home",
          icon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          label: "Search",
          icon: Icon(Icons.search),
        ),
        BottomNavigationBarItem(
          label: "Profile",
          icon: Icon(Icons.person),
        ),
      ],
      selectedFontSize: 12,
      unselectedFontSize: 12,
      currentIndex: userProvider.idx,
      onTap: (int idx) {
        userProvider.setPageIdx(idx);
      },
    );
  }
}

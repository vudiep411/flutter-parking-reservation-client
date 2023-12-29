import 'package:flutter/material.dart';
import 'home.dart';
import 'package:provider/provider.dart';
import 'provider.dart';
import './components/appbar.dart';
import './components/bottom_navbar.dart';
import 'profile.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: const MyApp(),
    ),
  );
}

class MainLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: NavBar(),
      ),
      body: Center(
        child: ValueListenableBuilder<int>(
          valueListenable: userProvider.currentPageNotifier,
          builder: (context, pageIndex, _) {
            switch (pageIndex) {
              case 0:
                return Home();
              case 2:
                return Profile();
              default:
                return SizedBox
                    .shrink(); // Return an empty widget or handle other cases if needed
            }
          },
        ),
      ),
      bottomNavigationBar: const BottomNavbar(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return MaterialApp(
      theme: ThemeData(
        brightness: userProvider.currentBrightness,
      ),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      title: 'Dashboard App',
      home: MainLayout(),
      routes: {
        '/search': (context) => MainLayout(),
      },
    );
  }
}

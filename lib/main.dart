import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pages/home.dart';
import './components/appbar.dart';
import './components/bottom_navbar.dart';
import 'api/reserve_api.dart';
import 'provider/provider.dart';
import 'pages/profile.dart';
import 'provider/dataprovider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => DataProvider()),
        // Add other providers if you have them
      ],
      child: const MyApp(),
    ),
  );
}

class MainLayout extends StatelessWidget {
  const MainLayout({super.key});

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
                Provider.of<DataProvider>(context, listen: false)
                    .fetchAvailableSpots();
                return Consumer<DataProvider>(
                  builder: (context, dataProvider, _) {
                    if (dataProvider.availableSpots.isEmpty) {
                      return const CircularProgressIndicator();
                    } else {
                      return Home(data: dataProvider.availableSpots);
                    }
                  },
                );
              case 1:
                return const Profile();
              default:
                return const SizedBox
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
      home: const MainLayout(),
      routes: {
        '/profile': (context) => const MainLayout(),
      },
    );
  }
}

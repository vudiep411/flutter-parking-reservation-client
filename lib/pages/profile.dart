import 'package:flutter/material.dart';
import '../components/appbar.dart';
import 'package:provider/provider.dart';
import '../provider/provider.dart';
import '../components/bottom_navbar.dart';
import './login.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);

    if (userProvider.jwtToken == null) {
      return Scaffold(
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SignInRegisterPage(),
                ),
              );
            },
            child: const Text('Sign in'),
          ),
        ),
      );
    } else {
      return const Scaffold(
        body: Center(
          child: Text('Profile'),
        ),
      );
    }
  }
}

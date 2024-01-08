import 'package:flutter/material.dart';
import '../provider/provider.dart';
import 'package:provider/provider.dart';

class SignInRegisterPage extends StatefulWidget {
  const SignInRegisterPage({super.key});

  @override
  _SignInRegisterPageState createState() => _SignInRegisterPageState();
}

class _SignInRegisterPageState extends State<SignInRegisterPage> {
  bool _isSignIn = true;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  void _toggleForm() {
    setState(() {
      _isSignIn = !_isSignIn;
    });
  }

  Map<String, String> get userData => {
        'email': _emailController.text.trim(),
        'password': _passwordController.text.trim(),
        if (!_isSignIn) 'name': _nameController.text.trim(),
        if (!_isSignIn) 'phoneNumber': _phoneController.text.trim(),
        if (!_isSignIn)
          'confirmPassword': _confirmPasswordController.text.trim(),
      };

  @override
  Widget build(BuildContext context) {
    List<Widget> formFields = [];
    final userProvider = Provider.of<UserProvider>(context);

    if (!_isSignIn) {
      formFields.addAll([
        buildFormField('Name', _nameController),
        buildFormField('Phone Number', _phoneController,
            keyboardType: TextInputType.phone),
      ]);
    }

    formFields.addAll([
      buildFormField('Email', _emailController,
          keyboardType: TextInputType.emailAddress),
      buildFormField('Password', _passwordController, obscureText: true),
    ]);

    if (!_isSignIn) {
      formFields.add(buildFormField(
          'Confirm Password', _confirmPasswordController,
          obscureText: true));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          _isSignIn ? 'Sign In' : 'Register',
          style: const TextStyle(fontSize: 16.0),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...formFields,
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                // Implement sign-in or register logic here
                if (_isSignIn) {
                  // Sign In Logic
                  print('Signing In...');
                  final res = await userProvider.signIn(userData);
                  if (res['error'] != null) {
                    // show error message
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Username or password is incorrect.'),
                        duration: Duration(seconds: 3),
                        backgroundColor: Colors.red,
                      ),
                    );
                  } else {
                    // redirect to profile
                    // ignore: use_build_context_synchronously
                    Navigator.pushReplacementNamed(context, '/profile');
                  }
                } else {
                  // Register Logic
                  print('Registering...');
                }
              },
              child: Text(_isSignIn ? 'Sign In' : 'Register'),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: _toggleForm,
              child: Text(_isSignIn
                  ? 'Don\'t have an account? Register'
                  : 'Already have an account? Sign In'),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildFormField(String labelText, TextEditingController controller,
      {TextInputType? keyboardType, bool obscureText = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(labelText: labelText),
        keyboardType: keyboardType,
        obscureText: obscureText,
      ),
    );
  }
}

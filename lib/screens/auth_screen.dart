import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';

var logger = Logger();

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  AuthScreenState createState() => AuthScreenState();
}

class AuthScreenState extends State<AuthScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late String _email;
  late String _password;

  Future<void> _signIn() async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: _email,
        password: _password,
      );
      // Handle successful sign-in, navigate to the next screen, etc.
      logger.d('Signed in: ${userCredential.user!.uid}');
    } on FirebaseAuthException catch (e) {
      // Handle sign-in errors, e.g., invalid email or password.
      logger.d('Failed to sign in: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Authentication'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              onChanged: (value) {
                setState(() {
                  _email = value;
                });
              },
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              onChanged: (value) {
                setState(() {
                  _password = value;
                });
              },
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Password'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _signIn,
              child: const Text('Sign In'),
            ),
          ],
        ),
      ),
    );
  }
}

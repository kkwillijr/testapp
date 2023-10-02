import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';

var logger = Logger();

Future<User?> signUp(String email, String password) async {
  //signing up a new a user
  try {
    UserCredential userCredential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential.user;
  } catch (e) {
    logger.d("Error during sign up: $e");
    return null;
  }
}

Future<User?> signIn(String email, String password) async {
  //signing in with existing user
  try {
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential.user;
  } catch (e) {
    logger.d("Error during sign in: $e");
    return null;
  }
}

Future<void> signOut() async {
  await FirebaseAuth.instance.signOut();
}

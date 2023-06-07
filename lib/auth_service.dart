import 'package:fluffy_train/login_page.dart';
import 'package:fluffy_train/modules/home/ui/home_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  signInWithGoogle(BuildContext context) async {
    final GoogleSignInAccount? googleUser =
        await GoogleSignIn(scopes: ["email"]).signIn();

    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final SharedPreferences prefs = await _prefs;

    return await FirebaseAuth.instance
        .signInWithCredential(credential)
        .then(
          (value) => Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const HomePage(),
            ),
          ),
        )
        .then((value) => prefs.setBool('logged', true));
  }

  signOut(BuildContext context) async {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const LoginPage(),
      ),
    );
    final SharedPreferences prefs = await _prefs;
    prefs.setBool('logged', false);
  }
}

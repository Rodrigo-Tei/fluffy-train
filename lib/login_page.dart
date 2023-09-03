import 'package:fluffy_train/auth_service.dart';
import 'package:fluffy_train/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton.icon(
          icon: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: SvgPicture.asset('assets/icons/google_icon.svg'),
          ),
          label: Text(
            'Entre com o Google',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: DefaultTheme.grayscale[Grayscale.black]),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: DefaultTheme.grayscale[Grayscale.white],
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          ),
          onPressed: () {
            AuthService().signInWithGoogle(context);
          },
        ),
      ),
    );
  }
}

import 'package:cyberbee_web/constants.dart';
import 'package:cyberbee_web/core/firebase_auth/firebase_auth.dart';
import 'package:cyberbee_web/presentation/auth/auth.dart';
import 'package:cyberbee_web/presentation/main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MyFirebaseAuth.checkUserIsLoggedIn().then((value) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => value
              ? MultiBlocProvider(
                  providers: providers,
                  child: MainScreen(),
                )
              : LoginScreen(),
        ),
      );
    });
    return const Placeholder();
  }
}

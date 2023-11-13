import 'package:e_library_nama_elib_mobile/view/screens/landing_screen.dart';
import 'package:e_library_nama_elib_mobile/view/screens/main_screen.dart';
import 'package:e_library_nama_elib_mobile/view/screens/sign_in_screen.dart';
import 'package:e_library_nama_elib_mobile/view/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: MainScreen.id,
      routes: {
        MainScreen.id: (context) => MainScreen(),
        SignInScreen.id: (context) => SignInScreen(),
        SignUpScreen.id: (context) => SignUpScreen(),
        LandingScreen.id: (context) => LandingScreen()
      },
    );
  }
}

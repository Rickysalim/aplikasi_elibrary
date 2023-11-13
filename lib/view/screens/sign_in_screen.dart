import 'package:e_library_nama_elib_mobile/view/screens/landing_screen.dart';
import 'package:e_library_nama_elib_mobile/view/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  static const String id = "sign_in_screen";
  @override
  SignInScreenState createState() => SignInScreenState();
}

class SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        decoration: BoxDecoration(
          color: Color.fromRGBO(77, 67, 187, 1),
          // gradient: LinearGradient(
          //   begin: Alignment.topRight,
          //   end: Alignment.bottomLeft,
          //   colors: [
          //     Colors.purple[300]!,
          //     Colors.purple[700]!,
          //   ],
          // ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Spacer(),
            Image.asset('assets/images/icon.png'), // Ganti dengan gambar yang diinginkan
            SizedBox(height: 48),
            Text(
              'Sign In',
              style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(height: 48),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Email',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Password',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              obscureText: true,
            ),
            SizedBox(height: 24),
            ElevatedButton(
              child: Text('Sign In'),
              onPressed: () => _goToLandingScreen(context),
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                onPrimary: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsets.symmetric(horizontal: 100, vertical: 20),
              ),
            ),
            Spacer(),
            TextButton(
              child: Text('Skip', style: TextStyle(color: Colors.white)),
              onPressed: () => _goToLandingScreen(context),
            ),
            TextButton(
              child: Text('Need to create an account? Sign Up',
                  style: TextStyle(color: Colors.white)),
              onPressed: () => _goToSignUp(context),
            ),
          ],
        ),
      ),
    );
  }

  void _goToLandingScreen(BuildContext context) {
    Navigator.pushNamed(context, LandingScreen.id);
  }

  void _goToSignUp(BuildContext context) {
    Navigator.pushNamed(context, SignUpScreen.id);
  }
}

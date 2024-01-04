import 'package:e_library_nama_elib_mobile/get_x/controller/auth_controllers.dart';
import 'package:e_library_nama_elib_mobile/view/screens/landing_screen.dart';
import 'package:e_library_nama_elib_mobile/view/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SignInScreen extends StatelessWidget {
  static const String id = "sign_in_screen";

  AuthController authController = Get.put(AuthController());
  
  final _formKey = GlobalKey<FormState>();

  AuthController signInController = Get.put(AuthController());

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromRGBO(77, 67, 187, 1),
        ),
        child: ListView(
          children: <Widget>[
            Image.asset('assets/images/icon.png',
                width: 150, height: 150), // Ganti dengan gambar yang diinginkan
            Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Text('Sign In',
                        style: TextStyle(
                              fontFamily: 'MochiyPopOne',
                          fontSize: 32,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        )))),
            Form(
              key: _formKey,
              child: Column(children: [
                Padding(
                    padding: EdgeInsets.all(20),
                    child: TextFormField(
                      controller: authController.email,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'please enter your email address';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Email',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    )),
                Padding(
                    padding: EdgeInsets.all(20),
                    child: TextFormField(
                      controller: authController.password,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'please enter your password';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Password',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      obscureText: true,
                    )),
                Padding(
                    padding: EdgeInsets.all(20),
                    child: ElevatedButton(
                      child: Text('Sign In',
                          style: TextStyle(
                              fontFamily: 'MochiyPopOne',color: Colors.white)),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          await authController.login();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(5, 15, 47, 1),
                        onPrimary: Colors.black,
                        minimumSize: Size.fromHeight(50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    )),
                Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(children: [
                      TextButton(
                        child: Text('Skip >',
                            style:
                                TextStyle(
                              fontFamily: 'MochiyPopOne',color: Colors.white)),
                        onPressed: () => Get.to(LandingScreen()),
                      ),
                      SizedBox(height: 10),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Need to create an account? ',
                                style: TextStyle(
                              fontFamily: 'MochiyPopOne',
                                    color: Colors.white)),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Color.fromRGBO(5, 15, 47, 1),
                                  onPrimary: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  )),
                              onPressed: () => Get.to(SignUpScreen()),
                              child: Text('Sign Up',
                                  style: TextStyle(
                              fontFamily: 'MochiyPopOne',
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ]),
                    ])),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

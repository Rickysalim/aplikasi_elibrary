import 'package:e_library_nama_elib_mobile/get_x/controller/auth_controllers.dart';
import 'package:e_library_nama_elib_mobile/view/screens/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SignUpScreen extends StatefulWidget {
  static const String id = "sign_up_screen";
  @override
  SignUpScreenState createState() => SignUpScreenState();
}

class SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  AuthController signUpController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              color: Color.fromRGBO(77, 67, 187, 1),
            ),
            child: ListView(children: <Widget>[
              Image.asset('assets/images/icon.png',
                  width: 150,
                  height: 150), // Ganti dengan gambar yang diinginkan
              Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Text('Sign Up',
                          style: TextStyle(
                              fontFamily: 'MochiyPopOne',
                            fontSize: 32,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          )))),
              Form(
                  key: _formKey,
                  child: Column(children: [
                    // Padding(
                    //     padding: EdgeInsets.all(10),
                    //     child: TextFormField(
                    //       validator: (value) {
                    //         if (value == null || value.isEmpty) {
                    //           return 'please enter your username';
                    //         }
                    //         return null;
                    //       },
                    //       controller: signUpController.username,
                    //       decoration: InputDecoration(
                    //         labelText: 'Username',
                    //         filled: true,
                    //         fillColor: Colors.white,
                    //         border: OutlineInputBorder(
                    //           borderRadius: BorderRadius.circular(30),
                    //         ),
                    //       ),
                    //     )),
                    Padding(
                        padding: EdgeInsets.all(10),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'please enter your email';
                            }
                            return null;
                          },
                          controller: signUpController.email,
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
                        padding: EdgeInsets.all(10),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'please enter your password';
                            }
                            return null;
                          },
                          controller: signUpController.password,
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
                        padding: EdgeInsets.all(10),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'please enter your confirm password';
                            }
                            if (value != signUpController.password.text) {
                              return 'confirm password does not match';
                            }
                            return null;
                          },
                          controller: signUpController.confirmPassword,
                          decoration: InputDecoration(
                            labelText: 'Confirm Password',
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          obscureText: true,
                        )),
                    Padding(
                        padding: EdgeInsets.all(10),
                        child: ElevatedButton(
                          child: Text('Sign Up',
                              style: TextStyle(
                              fontFamily: 'MochiyPopOne',
                                  color: Colors.white)),
                          onPressed: () async {
                            if(_formKey.currentState!.validate()) { 
                               await signUpController.register();
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
                        padding: EdgeInsets.all(10),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Already have an account? ',
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
                                onPressed: () =>  Get.to(SignInScreen()),
                                child: Text('Sign In',
                                    style: TextStyle(
                              fontFamily: 'MochiyPopOne',
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ]))
                  ])),
            ])));
  }

  void _goToLogin(BuildContext context) {
    Navigator.pushNamed(context, SignInScreen.id);
  }
}

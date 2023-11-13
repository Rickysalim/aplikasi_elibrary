import 'package:e_library_nama_elib_mobile/view/screens/landing_screen.dart';
import 'package:e_library_nama_elib_mobile/view/screens/sign_in_screen.dart';
import 'package:e_library_nama_elib_mobile/view/screens/sign_up_screen.dart';
import 'package:e_library_nama_elib_mobile/view/widgets/loading.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  static const String id = "";

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late bool _isLoading;

  @override
  void initState() {
    _isLoading = true;
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
  }

  void _goToSignIn(BuildContext context) {
    Navigator.pushNamed(context, SignInScreen.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Color.fromRGBO(77, 67, 187, 1)
            ),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(child: Image.asset('assets/images/icon.png')),
                  Container(
                      margin: EdgeInsets.all(45),
                      child: 
                      _isLoading 
                      ? 
                      Text('E-BOOK', 
                      style: 
                        TextStyle(color: Color.fromRGBO(255, 255, 255, 1), fontSize: 48)
                      )
                      :
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromRGBO(255, 255, 255, 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                          onPressed: () => _goToSignIn(context),
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 50, right: 50, top: 20, bottom: 20),
                            child: Text('GET STARTED',style: TextStyle(color: Color.fromRGBO(0, 0, 0, 1)),),
                          )))
                ])));
  }
}

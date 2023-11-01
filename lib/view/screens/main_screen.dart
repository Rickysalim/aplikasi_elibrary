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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage("assets/images/bg_main.gif"),
        fit: BoxFit.cover,
      )),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                    margin: EdgeInsets.all(20),
                    child: _isLoading
                        ? Loading()
                        : ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Color.fromRGBO(255, 182, 193, 0.8),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            onPressed: () {},
                            child: Padding(
                              padding: EdgeInsets.all(20),
                              child: Text('GET STARTED'),
                            )))),
          )
        ],
      ),
    ));
  }
}

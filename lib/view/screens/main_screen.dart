import 'package:e_library_nama_elib_mobile/get_x/guards/splash_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  static const String id = "";

  SplashScreenController splashScreenController =
      Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    return GetX<SplashScreenController>(
        init: splashScreenController,
        builder: (controller) {
          return Scaffold(
              body: Container(
                  alignment: Alignment.center,
                  decoration:
                      BoxDecoration(color: Color.fromRGBO(77, 67, 187, 1)),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(child: Image.asset('assets/images/icon.png')),
                        Container(
                            margin: EdgeInsets.all(45),
                            child: controller.isLoading.value
                                ? Text('E-BOOK',
                                    style: TextStyle(
                                        fontFamily: 'Barriecito',
                                        color: Color.fromRGBO(255, 255, 255, 1),
                                        fontSize: 48))
                                : Container(
                                    margin: EdgeInsets.only(top: 50),
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              Color.fromRGBO(255, 255, 255, 1),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                          ),
                                        ),
                                        onPressed: () async =>
                                            await splashScreenController
                                                .setIsViewed(1),
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              left: 50,
                                              right: 50,
                                              top: 10,
                                              bottom: 10),
                                          child: Text(
                                            'GET STARTED',
                                            style: TextStyle(
                                                fontFamily: 'MochiyPopOne',
                                                color:
                                                    Color.fromRGBO(0, 0, 0, 1),
                                                fontWeight: FontWeight.w800),
                                          ),
                                        ))))
                      ])));
        });
  }
}

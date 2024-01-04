import 'package:e_library_nama_elib_mobile/view/screens/landing_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';


class CategoryScreen extends StatefulWidget {
  static const String id = "category_screen";

  @override
  _CategoryScreenScreenState createState() => _CategoryScreenScreenState();
}

class _CategoryScreenScreenState extends State<CategoryScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
              Color.fromRGBO(77, 67, 187, 1),
              Color.fromRGBO(255, 255, 255, 1),
            ])),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(5),
              child: Column(children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                          padding: EdgeInsets.all(10),
                          child: IconButton(
                            iconSize: 40,
                            color: Colors.white,
                            icon: Icon(Icons.arrow_back),
                            onPressed: () => Get.back()
                          )),
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Image.asset('assets/images/icon-small.png'),
                      ),
                      Text('CATEGORY',
                          style: TextStyle(
                              fontFamily: 'MochiyPopOne',
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                      Padding(
                          padding: EdgeInsets.all(8),
                          child: SvgPicture.asset(
                              'assets/svg/book-icon-white.svg')),
                    ]),
                Column(children: [
                  Container(
                      padding: EdgeInsets.all(5),
                      margin: EdgeInsets.all(5),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromRGBO(255, 220, 220, 1),
                            alignment: Alignment.center,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Text('Fav Banget',
                                    style: TextStyle(
                              fontFamily: 'MochiyPopOne',
                                        fontSize: 20, color: Colors.black)),
                              ),
                              Container(
                                child: Image.asset(
                                    'assets/images/book-stack.png',
                                    width: 150,
                                    height: 150),
                              ),
                            ],
                          ))),
                  Container(
                      padding: EdgeInsets.all(5),
                      margin: EdgeInsets.all(5),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromRGBO(255, 255, 255, 1),
                            alignment: Alignment.center,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Text('Basic',
                                    style: TextStyle(
                              fontFamily: 'MochiyPopOne',
                                        fontSize: 20, color: Colors.black)),
                              ),
                              Container(
                                child: Image.asset('assets/images/child.png'),
                              ),
                            ],
                          ))),
                  Container(
                      padding: EdgeInsets.all(5),
                      margin: EdgeInsets.all(5),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromRGBO(255, 220, 220, 1),
                            alignment: Alignment.center,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Text('C++',
                                    style: TextStyle(
                              fontFamily: 'MochiyPopOne',
                                        fontSize: 20, color: Colors.black)),
                              ),
                              Container(
                                child:
                                    Image.asset('assets/images/teenager.png'),
                              ),
                            ],
                          ))),
                  Container(
                      padding: EdgeInsets.all(5),
                      margin: EdgeInsets.all(5),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromRGBO(255, 255, 255, 1),
                            alignment: Alignment.center,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Text('Javascript',
                                    style: TextStyle(
                              fontFamily: 'MochiyPopOne',
                                        fontSize: 20, color: Colors.black)),
                              ),
                              Container(
                                child: Image.asset('assets/images/adult.png'),
                              ),
                            ],
                          ))),
                ])
              ]),
            )
          ],
        ),
      ),
    );
  }
}

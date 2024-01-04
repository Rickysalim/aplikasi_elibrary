import 'package:e_library_nama_elib_mobile/get_x/controller/auth_controllers.dart';
import 'package:e_library_nama_elib_mobile/get_x/controller/book_controller.dart';
import 'package:e_library_nama_elib_mobile/get_x/controller/book_list_user.dart';
import 'package:e_library_nama_elib_mobile/get_x/guards/user_guards_controller.dart';
import 'package:e_library_nama_elib_mobile/view/screens/booklist_screen.dart';
import 'package:e_library_nama_elib_mobile/view/screens/category_screen.dart';
import 'package:e_library_nama_elib_mobile/view/screens/setting_screen.dart';
import 'package:e_library_nama_elib_mobile/view/screens/sign_in_screen.dart';
import 'package:e_library_nama_elib_mobile/view/widgets/book_cover_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_svg/flutter_svg.dart';

class LandingScreen extends StatefulWidget {
  static const String id = "landing_screen";

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  AuthController authController = Get.put(AuthController());
  UserGuardsController userGuardsController = Get.put(UserGuardsController());
  BookController bookController = Get.put(BookController());
  BookListUserController bookListUserController = Get.put(BookListUserController()); //
  
  // List<Book> dummyList = books;
  // List<Book> dummyList2 = books;
  // ScrollController _scrollController = ScrollController();
  // ScrollController _scrollController2 = ScrollController();
  // int _currentMax = 10;
  // late bool _isLoading;

  @override
  void initState() {

    super.initState();
    // _isLoading = true;
    // Future.delayed(const Duration(seconds: 2), () {
    //   setState(() {
    //     _isLoading = false;
    //   });
    // });
    // dummyList = List.generate(10, (index) => "Item : ${index + 1}");
    // dummyList2 = List.generate(10, (index) => "Item : ${index + 1}");

    // _scrollController.addListener(() {
    //   if (_scrollController.position.pixels ==
    //       _scrollController.position.maxScrollExtent) {
    //     _getMoreList();
    //   }
    // });
    // _scrollController2.addListener(() {
    //   if (_scrollController.position.pixels ==
    //       _scrollController.position.maxScrollExtent) {
    //     _getMoreList();
    //   }
    // });
  
  }

  // void _getMoreList() {
  //   print("Get More List");
  //   for (int i = _currentMax; i < _currentMax + 10; i++) {
  //     dummyList.add("Item : ${i + 1}");
  //     dummyList2.add("Item : ${i + 1}");
  //   }
  //   _currentMax = _currentMax + 10;
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            toolbarHeight: 100,
            title: Text('HOME',
                style: TextStyle(
                  fontFamily: 'MochiyPopOne',
                )),
            backgroundColor: const Color.fromRGBO(77, 67, 187, 1),
            leading: Builder(builder: (BuildContext context) {
              return IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    'assets/images/icon-small.png',
                  ));
            }),
            actions: [
              userGuardsController.auth.currentUser != null
                  ? TextButton(
                      onPressed: () async => await authController.logout(),
                      child: Text('Sign Out',
                          style: TextStyle(
                              fontFamily: 'MochiyPopOne', color: Colors.white)))
                  : TextButton(
                      onPressed: () => Get.to(SignInScreen()),
                      child: Text('Sign In',
                          style: TextStyle(
                              fontFamily: 'MochiyPopOne', color: Colors.white)))
            ]),
        body: ListView(children: <Widget>[
          SizedBox(height: 10),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Color.fromRGBO(116, 185, 215, 1)),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Welcome to',
                              style: TextStyle(
                                  fontFamily: 'MochiyPopOne',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Color.fromRGBO(21, 0, 67, 1))),
                          Text('ourBooks!',
                              style: TextStyle(
                                  fontFamily: 'MochiyPopOne',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Color.fromRGBO(21, 0, 67, 1))),
                          Text('Let’s organize your library',
                              style: TextStyle(
                                  fontFamily: 'MochiyPopOne',
                                  color: Color.fromRGBO(21, 0, 67, 1))),
                          Text('with us',
                              style: TextStyle(
                                  fontFamily: 'MochiyPopOne',
                                  color: Color.fromRGBO(21, 0, 67, 1))),
                        ],
                      ),
                    ),
                    Container(
                        child:
                            Image.asset("assets/images/watercolor_books.png"),
                        height: 100,
                        width: 100)
                  ]),
            ),
          ),
          Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topCenter,
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Top Book ',
                              style: TextStyle(
                                  fontFamily: 'OdorMeanChey',
                                  fontWeight: FontWeight.bold)),
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                'See All',
                                style: TextStyle(
                                    fontFamily: 'OdorMeanChey',
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(221, 56, 56, 1)),
                              ))
                        ]),
                  ),
                ],
              )),
          // SizedBox(
          //   height: 150.0,
          //   child: ListView.builder(
          //     scrollDirection: Axis.horizontal,
          //     itemCount: dummyList.length,
          //     itemBuilder: (BuildContext context, int index) {
          //       return Container(
          //           width: 150.0,
          //           padding: EdgeInsets.all(5),
          //           child: GestureDetector(
          //               onTap: () => Get.to(DetailBookScreen(dummyList[index])),
          //               // {
          //               //   Navigator.pushNamed(context, DetailBookScreen.id,
          //               //       arguments: dummyList[index]);
          //               // },
          //               child: dummyList[index].book_image != null
          //                   ? Image.asset(dummyList[index].book_image)
          //                   : Text('No Picture')));
          //     },
          //   ),
          // ),
          BookCoverWidget(future: bookController.getBookByRating()),
          Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topCenter,
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Recommended For You ',
                              style: TextStyle(
                                  fontFamily: 'OdorMeanChey',
                                  fontWeight: FontWeight.bold)),
                          TextButton(
                              onPressed: () {},
                              child: Text('See All',
                                  style: TextStyle(
                                      fontFamily: 'OdorMeanChey',
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromRGBO(221, 56, 56, 1))))
                        ]),
                  ),
                ],
              )),
              BookCoverWidget(future: bookController.getBookByView()),
          // SizedBox(
          //   height: 150.0,
          //   child: ListView.builder(
          //     scrollDirection: Axis.horizontal,
          //     itemCount: dummyList2.length,
          //     itemBuilder: (BuildContext context, int index) {
          //       return Container(
          //           width: 150.0,
          //           child: GestureDetector(
          //               onTap: () => Get.to(DetailBookScreen(dummyList[index])),
          //               child: dummyList2[index].book_image != null
          //                   ? Image.asset(dummyList2[index].book_image)
          //                   : Text('No Picture')));
          //     },
          //   ),
          // ),
          SizedBox(height: 10)
        ]),
        bottomNavigationBar: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30), topLeft: Radius.circular(30)),
            ),
            child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
                child: BottomNavigationBar(
                  backgroundColor: Color.fromRGBO(20, 48, 199, 0.09),
                  type: BottomNavigationBarType.fixed,
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  items: <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset('assets/svg/house-icon.svg'),
                      label: '',
                    ),
                    BottomNavigationBarItem(
                      icon: GestureDetector(
                          child: SvgPicture.asset('assets/svg/book-icon.svg'),
                          onTap: () => Get.to(CategoryScreen())),
                      label: '',
                    ),
                    BottomNavigationBarItem(
                      icon: GestureDetector(
                          child: SvgPicture.asset('assets/svg/mark.svg'),
                          onTap: () => Get.to(BookListScreen())),
                      label: '',
                    ),
                    BottomNavigationBarItem(
                      icon: GestureDetector(
                          child: SvgPicture.asset('assets/svg/burger-icon.svg'),
                          onTap: () => Get.to(SettingScreen())),
                      label: '',
                    ),
                  ],
                ))));
  }
}

import 'package:e_library_nama_elib_mobile/view/widgets/list_vertical.dart';
import 'package:e_library_nama_elib_mobile/view/widgets/skeleton.dart';
import 'package:e_library_nama_elib_mobile/view/widgets/skeleton_listview.dart';
import 'package:flutter/material.dart';

class LandingScreen extends StatefulWidget {
  static const String id = "landing_screen";

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  List dummyList = [];
  List dummyList2 = [];
  ScrollController _scrollController = ScrollController();

  ScrollController _scrollController2 = ScrollController();
  int _currentMax = 10;
  late bool _isLoading;

  @override
  void initState() {
    super.initState();
    _isLoading = true;
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
      });
    });
    dummyList = List.generate(10, (index) => "Item : ${index + 1}");
    dummyList2 = List.generate(10, (index) => "Item : ${index + 1}");
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _getMoreList();
      }
    });
    _scrollController2.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _getMoreList();
      }
    });
  }

  void _getMoreList() {
    print("Get More List");
    for (int i = _currentMax; i < _currentMax + 10; i++) {
      dummyList.add("Item : ${i + 1}");
      dummyList2.add("Item : ${i + 1}");
    }
    _currentMax = _currentMax + 10;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            toolbarHeight: 100,
            title: Text('HOME'),
            backgroundColor: Color.fromRGBO(77, 67, 187, 1)),
        drawer: Drawer(
          child: ListView(
            children: const [
              Padding(
                padding: EdgeInsets.all(0.0),
                child: Column(children: []),
              )
            ],
          ),
        ),
        body: Container(
          child: Column(children: <Widget>[
            SizedBox(height: 20),
            Expanded(
              child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
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
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30,
                                      color: Color.fromRGBO(21, 0, 67, 1))),
                              Text('ourBooks!',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30,
                                      color: Color.fromRGBO(21, 0, 67, 1))),
                              Text('Let’s organize your library',
                                  style: TextStyle(
                                      color: Color.fromRGBO(21, 0, 67, 1))),
                              Text('with us',
                                  style: TextStyle(
                                      color: Color.fromRGBO(21, 0, 67, 1))),
                            ],
                          ),
                        ),
                        Container(
                            child: Image.asset(
                                "assets/images/watercolor_books.png"))
                      ]),
                ),
              ),
            ),
            Expanded(
              child: Align(
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
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'See All',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromRGBO(221, 56, 56, 1)),
                                  ))
                            ]),
                      ),
                      _isLoading
                          ? ListVerticalSkeleton(
                              data: dummyList, itemExtent: 80)
                          : ListVertical(
                              data: dummyList,
                              itemExtent: 80,
                              scrollController: _scrollController),
                    ],
                  )),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Align(
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
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              TextButton(
                                  onPressed: () {},
                                  child: Text('See All',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color:
                                              Color.fromRGBO(221, 56, 56, 1))))
                            ]),
                      ),
                      _isLoading
                          ? ListVerticalSkeleton(
                              data: dummyList2, itemExtent: 80)
                          : ListVertical(
                              data: dummyList2,
                              itemExtent: 80,
                              scrollController: _scrollController2),
                    ],
                  )),
            ),
          ]),
        ),
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
                  backgroundColor: Color.fromRGBO(77, 67, 187, 1),
                  type: BottomNavigationBarType.fixed,
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  items: const <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: '',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.book),
                      label: '',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.add),
                      label: '',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.menu),
                      label: '',
                    ),
                  ],
                ))));
  }
}

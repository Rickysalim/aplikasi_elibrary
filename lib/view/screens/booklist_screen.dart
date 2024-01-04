import 'package:e_library_nama_elib_mobile/get_x/controller/book_list_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class BookListScreen extends StatelessWidget {
  static const String id = "booklist_screen";

  final bookListUserController = Get.put(BookListUserController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BookListUserController>(
        init: bookListUserController,
        builder: (controller) {
          return WillPopScope(
              onWillPop: () async {
                controller.onClose();
                return true;
              },
              child: Scaffold(
                  appBar: AppBar(
                    backgroundColor: Color.fromRGBO(77, 67, 187, 1),
                    centerTitle: true,
                    title: Text('BOOKLIST',
                        style: TextStyle(
                            fontFamily: 'MochiyPopOne',
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                    leading: Builder(builder: (BuildContext context) {
                      return controller.isActiveLongPress.value
                          ? Row(children: [
                              IconButton(
                                  onPressed: () {
                                    controller.clearAll();
                                  },
                                  icon: Icon(Icons.cancel_sharp)),
                              Text(controller.countChecklist().toString())
                            ])
                          : IconButton(
                              onPressed: () {
                                controller.onClose();
                                Get.back();
                              },
                              icon: Icon(Icons.arrow_back));
                    }),
                    actions: [
                      IconButton(
                          onPressed: () {
                            Get.defaultDialog(
                                title: 'Confirmation',
                                content:
                                    Text('Are you sure you want to delete?'),
                                textConfirm: 'Yes',
                                textCancel: 'No',
                                onConfirm: () {
                                  controller.deleteBookList();
                                  controller.setLongPress();
                                  Get.back();
                                },
                                onCancel: () => Get.back());
                          },
                          icon: Icon(Icons.delete))
                    ],
                  ),
                  body: StreamBuilder<List<Map<String, dynamic>>>(
                      stream: controller.getAllBookListUser(),
                      initialData: [],
                      builder: (context, snapshot) {
                        List<Map<String, dynamic>> booklist = snapshot.data!;
                        controller.setOptions(booklist);
                        if (snapshot.hasData && snapshot.data != null) {
                          return ListView.builder(
                              itemCount: booklist.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                    onLongPress: () {
                                      controller.setLongPress();
                                    },
                                    onTapDown: (value) {
                                      if (controller.setListOptions[index]
                                                  ["book_id"] ==
                                              booklist[index]["book_id"] &&
                                          controller.isActiveLongPress.value) {
                                        if (controller.setListOptions[index]
                                                ["book_checked"] ==
                                            true) {
                                          controller.uncheckedListOption(index);
                                        } else {
                                          controller.checkedListOption(index);
                                        }
                                      }
                                    },
                                    child: Container(
                                        margin: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          color:
                                              controller.isActiveLongPress.value
                                                  ? Color.fromRGBO(
                                                      79, 70, 175, 0.21)
                                                  : Color.fromRGBO(
                                                      217, 217, 217, 1),
                                        ),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                  padding:
                                                      EdgeInsets.only(top: 10),
                                                  width: 100,
                                                  height: 150,
                                                  child: Align(
                                                      alignment:
                                                          Alignment.bottomRight,
                                                      child: Visibility(
                                                        visible: controller
                                                                .isActiveLongPress
                                                                .value
                                                            ? true
                                                            : false,
                                                        child: controller.setListOptions[
                                                                            index]
                                                                        [
                                                                        "book_id"] ==
                                                                    booklist[
                                                                            index]
                                                                        [
                                                                        "book_id"] &&
                                                                controller
                                                                    .isActiveLongPress
                                                                    .value
                                                            ? controller.setListOptions[
                                                                            index]
                                                                        [
                                                                        "book_checked"] ==
                                                                    true
                                                                ? SvgPicture.asset(
                                                                    "assets/svg/checklist.svg")
                                                                : SvgPicture.asset(
                                                                    "assets/svg/unchecklist.svg")
                                                            : Text(''),
                                                      )),
                                                  decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                          fit: BoxFit.cover,
                                                          image: NetworkImage(
                                                              booklist[index][
                                                                      "book_image"]
                                                                  .toString())))),
                                              Container(
                                                  padding: EdgeInsets.all(8),
                                                  child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          booklist[index]
                                                                  ["book_name"]
                                                              .toString(),
                                                        ),
                                                        Text(
                                                          'by ${booklist[index]["book_author"].toString()}',
                                                        ),
                                                        IgnorePointer(
                                                            ignoring: true,
                                                            child: RatingBar
                                                                .builder(
                                                              initialRating: booklist[index]["book_rating"].toDouble(),
                                                              minRating: 1,
                                                              direction: Axis
                                                                  .horizontal,
                                                              allowHalfRating:
                                                                  true,
                                                              itemCount: 5,
                                                              itemSize: 8,
                                                              itemPadding: EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          2.0),
                                                              itemBuilder:
                                                                  (context,
                                                                          _) =>
                                                                      Icon(
                                                                Icons.star,
                                                                color: Colors
                                                                    .amber,
                                                              ),
                                                              onRatingUpdate:
                                                                  (rating) {
                                                                print(rating);
                                                              },
                                                            )),
                                                        Text(
                                                          '${booklist[index]["book_rating"].toString()} Rating',
                                                        ),
                                                        Text(
                                                          '${booklist[index]["book_pages"].toString()} page',
                                                        ),
                                                      ])),
                                            ])));
                              });
                        } else if (snapshot.hasError) {
                          return Center(
                            child: Text(snapshot.error.toString()),
                          );
                        } else {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      })));

          // body: Container(
          //   decoration: BoxDecoration(
          //       gradient: LinearGradient(
          //           begin: Alignment.topRight,
          //           end: Alignment.bottomLeft,
          //           colors: [
          //         Color.fromRGBO(77, 67, 187, 1),
          //         Color.fromRGBO(255, 255, 255, 1),
          //       ])),
          //   child: ListView(
          //     padding: EdgeInsets.zero,
          //     children: <Widget>[
          //       Padding(
          //         padding: EdgeInsets.all(5),
          //         child: Column(children: [
          //           Row(
          //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //               children: [
          //                 Padding(
          //                     padding: EdgeInsets.all(10),
          //                     child: IconButton(
          //                       iconSize: 40,
          //                       color: Colors.white,
          //                       icon: Icon(Icons.arrow_back),
          //                       onPressed: () {
          //                         Navigator.of(context)
          //                             .popAndPushNamed(LandingScreen.id);
          //                       },
          //                     )),
          //                 Padding(
          //                   padding: EdgeInsets.all(8),
          //                   child: Image.asset('assets/images/icon-small.png'),
          //                 ),
          //                 Text('Book List',
          //                     style: TextStyle(
          //                         fontFamily: 'MochiyPopOne',
          //                         fontSize: 15,
          //                         color: Colors.white,
          //                         fontWeight: FontWeight.bold)),
          //                 Padding(
          //                     padding: EdgeInsets.all(8),
          //                     child: SvgPicture.asset(
          //                         'assets/svg/add-icon-white.svg')),
          //               ]),
          //           SizedBox(height: 20),
          //           Column(children: [
          //             Padding(
          //                 padding: EdgeInsets.all(5),
          //                 child: Row(
          //                   mainAxisAlignment: MainAxisAlignment.center,
          //                   children: <Widget>[
          //                     Container(
          //                         width: 240,
          //                         height: 150,
          //                         decoration: BoxDecoration(
          //                           borderRadius: BorderRadius.only(
          //                               topLeft: Radius.circular(20),
          //                               bottomLeft: Radius.circular(20)),
          //                           color: Color.fromRGBO(255, 220, 220, 1),
          //                         ),
          //                         child: Align(
          //                             alignment: Alignment.centerLeft,
          //                             child: Padding(
          //                               padding: EdgeInsets.all(20),
          //                               child: Text('Book List',
          //                                   style: TextStyle(
          //                                       fontFamily: 'MochiyPopOne',
          //                                       fontSize: 20,
          //                                       color: Colors.black)),
          //                             ))),
          //                     Container(
          //                         width: 100,
          //                         height: 150,
          //                         decoration: BoxDecoration(
          //                             borderRadius: BorderRadius.only(
          //                                 topRight: Radius.circular(20),
          //                                 bottomRight: Radius.circular(
          //                                     20)), // Ganti dengan tinggi yang diinginkan
          //                             color: Color.fromRGBO(255, 255, 255, 1)),
          //                         child: Align(
          //                           alignment: Alignment.center,
          //                           child: Column(
          //                               mainAxisAlignment: MainAxisAlignment.center,
          //                               children: [
          //                                 Text('+',
          //                                     style: TextStyle(
          //                                         fontFamily: 'MochiyPopOne',
          //                                         fontSize: 20,
          //                                         color: Colors.black)),
          //                                 Text('Add',
          //                                     style: TextStyle(
          //                                         fontFamily: 'MochiyPopOne',
          //                                         fontSize: 20,
          //                                         color: Colors.black))
          //                               ]),
          //                         )),
          //                   ],
          //                 )),
          //             Padding(
          //               padding: EdgeInsets.all(5),
          //               child: Row(
          //                 mainAxisAlignment: MainAxisAlignment.center,
          //                 children: <Widget>[
          //                   Container(
          //                       width: 240,
          //                       height: 150,
          //                       decoration: BoxDecoration(
          //                         borderRadius: BorderRadius.only(
          //                             topLeft: Radius.circular(20),
          //                             bottomLeft: Radius.circular(20)),
          //                         color: Color.fromRGBO(255, 255, 255, 1),
          //                       ),
          //                       child: Align(
          //                           alignment: Alignment.centerLeft,
          //                           child: Padding(
          //                             padding: EdgeInsets.all(20),
          //                             child: Text('Book List',
          //                                 style: TextStyle(
          //                                     fontFamily: 'MochiyPopOne',
          //                                     fontSize: 20,
          //                                     color: Colors.black)),
          //                           ))),
          //                   Container(
          //                       width: 100,
          //                       height: 150,
          //                       decoration: BoxDecoration(
          //                           borderRadius: BorderRadius.only(
          //                               topRight: Radius.circular(20),
          //                               bottomRight: Radius.circular(
          //                                   20)), // Ganti dengan tinggi yang diinginkan
          //                           color: Color.fromRGBO(21, 0, 67, 1)),
          //                       child: Align(
          //                         alignment: Alignment.center,
          //                         child: Column(
          //                             mainAxisAlignment: MainAxisAlignment.center,
          //                             children: [
          //                               Text('+',
          //                                   style: TextStyle(
          //                                       fontFamily: 'MochiyPopOne',
          //                                       fontSize: 20,
          //                                       color: Colors.white)),
          //                               Text('Add',
          //                                   style: TextStyle(
          //                                       fontFamily: 'MochiyPopOne',
          //                                       fontSize: 20,
          //                                       color: Colors.white))
          //                             ]),
          //                       )),
          //                 ],
          //               ),
          //             )
          //           ])
          //         ]),
          //       )
          //     ],
          //   ),
          // ),
        });
  }
}

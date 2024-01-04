import 'package:e_library_nama_elib_mobile/get_x/controller/book_list_user.dart';
import 'package:e_library_nama_elib_mobile/models/Book.dart';
import 'package:e_library_nama_elib_mobile/view/screens/pdfviewer_screen.dart';
import 'package:e_library_nama_elib_mobile/view/screens/sharelink_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class DetailBookScreen extends StatelessWidget {
  static const String id = "detail_book_screen";
  DetailBookScreen(this.book);

  final Book? book;
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
                    title: Text('Detail Book'),
                    leading: Builder(builder: (BuildContext context) {
                      return IconButton(
                        onPressed: () {
                          controller.onClose();
                          Get.back();
                        },
                        icon: Icon(Icons.arrow_back),
                      );
                    }),
                    actions: [
                      controller.alreadyExists.value == true
                          ? IconButton(
                              onPressed: () {
                                controller.deleteBookListByDoc();
                              },
                              icon: SvgPicture.asset(
                                  'assets/svg/wishlist-checked.svg'))
                          : IconButton(
                              onPressed: () {
                                controller.addBookList(book!);
                              },
                              icon:
                                  SvgPicture.asset('assets/svg/wishlist.svg')),
                      IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset('assets/svg/star.svg')),
                      IconButton(
                          onPressed: () {
                            if (book!.book_pdf_url != "") {
                              Get.to(ShareLink(book!.book_pdf_url));
                            }
                          },
                          icon: SvgPicture.asset('assets/svg/share.svg'))
                    ]),
                body: book != null
                    ? LayoutBuilder(
                        //for future purpose if needed
                        builder: (context, constraints) {
                          return Stack(
                            alignment: Alignment.topCenter, // defult topLeft
                            children: [
                              Column(
                                children: [
                                  Expanded(
                                    child: Container(
                                      color: Color.fromRGBO(77, 67, 187, 1),
                                      child: Container(
                                        margin: EdgeInsets.only(
                                            top: 10, bottom: 10),
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            color: const Color.fromRGBO(
                                                77, 67, 187, 1)),
                                        child: Image.network(book!.book_image!,
                                            width: 250, height: 250),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                        color: Color.fromRGBO(255, 255, 255, 1),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(20),
                                                  topRight:
                                                      Radius.circular(20)),
                                              color: const Color.fromRGBO(
                                                  255, 255, 255, 1)),
                                          child: ListView(children: [
                                            Padding(
                                                padding: EdgeInsets.all(20),
                                                child: Text(
                                                    book!.book_name ?? 'NA',
                                                    textAlign: TextAlign.left)),
                                            Padding(
                                                padding: EdgeInsets.all(20),
                                                child: Align(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Text(
                                                        book!.book_author ??
                                                            'NA',
                                                        textAlign:
                                                            TextAlign.left))),
                                            Padding(
                                                padding: EdgeInsets.all(20),
                                                child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      Column(children: [
                                                        Text('Rating'),
                                                        IgnorePointer(
                                                            ignoring: true,
                                                            child: RatingBar
                                                                .builder(
                                                              initialRating: book!
                                                                  .book_rating
                                                                  .toDouble(),
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
                                                            '${book!.book_rating.toDouble()}',
                                                            textAlign:
                                                                TextAlign.left),
                                                      ]),
                                                      VerticalDivider(
                                                        width: 20,
                                                        thickness: 1,
                                                        indent: 20,
                                                        endIndent: 0,
                                                        color: Colors.black,
                                                      ),
                                                      Column(children: [
                                                        Text('Pages'),
                                                        Text(
                                                            '${book!.book_pages ?? 0}',
                                                            textAlign:
                                                                TextAlign.left),
                                                      ]),
                                                      VerticalDivider(
                                                        width: 20,
                                                        thickness: 1,
                                                        indent: 20,
                                                        endIndent: 0,
                                                        color: Colors.black,
                                                      ),
                                                      Column(children: [
                                                        Text('View'),
                                                        Text(
                                                            '${book!.book_view ?? 0}',
                                                            textAlign:
                                                                TextAlign.left),
                                                      ]),
                                                    ])),
                                            Padding(
                                                padding: EdgeInsets.all(20),
                                                child: Text(
                                                    book!.book_description ??
                                                        'NA',
                                                    textAlign: TextAlign.left)),
                                            Padding(
                                                padding: EdgeInsets.all(20),
                                                child: ElevatedButton(
                                                    onPressed: () {
                                                      if (book!.book_pdf_url !=
                                                          "") {
                                                        Get.to(PdfViewerScreen(
                                                            url: book!
                                                                .book_pdf_url
                                                                .toString()));
                                                      }
                                                    },
                                                    child: Text(
                                                        book!.book_pdf_url != ""
                                                            ? "Read"
                                                            : "Unavailable"))),
                                          ]),
                                        )),
                                  ),
                                ],
                              ),
                            ],
                          );
                        },
                      )
                    : Align(
                        child: Padding(
                            padding: EdgeInsets.all(20),
                            child: Text('404 Not Found',
                                style: TextStyle(
                                    fontFamily: 'MochiyPopOne', fontSize: 50))),
                        alignment: Alignment.center),
              ));
        });
  }
}

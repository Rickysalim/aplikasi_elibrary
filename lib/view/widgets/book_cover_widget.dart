import 'package:e_library_nama_elib_mobile/get_x/controller/book_list_user.dart';
import 'package:e_library_nama_elib_mobile/models/Book.dart';
import 'package:e_library_nama_elib_mobile/view/screens/detail_book_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookCoverWidget extends StatelessWidget {
  BookCoverWidget({required this.future});

  final BookListUserController booklist = Get.put(BookListUserController());

  final Future<List<Book>> future;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
        height: 150.0,
        child: FutureBuilder(
            future: future,
            builder: ((context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  List<Book>? bookData = snapshot.data;
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: bookData?.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(padding: EdgeInsets.all(10),child:Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(bookData![index].book_image!),
                            ),
                          ),
                          width: 100.0,
                          padding: EdgeInsets.all(5),
                          child: GestureDetector(
                              onTap: () { 
                                booklist.setBookId(bookData[index].book_id.toString());
                                Get.to(DetailBookScreen(bookData[index]));
                              }
                              // child: 
                              // bookData?[index].book_image != null
                              //     ? Image.network(bookData![index].book_image)
                              //     : Text('No Picture'))
                          )));
                    },
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                } else {
                  return Center(
                    child: Text('Something went wrong'),
                  );
                }
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            })));
  }
}

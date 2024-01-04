import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_library_nama_elib_mobile/models/BookListUser.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookListUserRepositoryController extends GetxController {
  static BookListUserRepositoryController get instance => Get.find();

  final bookList = FirebaseFirestore.instance.collection('Book');
  final bookListUser = FirebaseFirestore.instance.collection('BookListUser');
  final bookListUserbyId =  FirebaseFirestore.instance.collection('BookListUser').doc();

  Future<void> addBookListUser(BookListUser data) async {
     data.book_list_id = bookListUserbyId.id;
     await bookListUserbyId.set(data.toMap()).whenComplete(() {
       Get.snackbar("Berhasil", "Berhasil Menambah Buku", duration: Duration(seconds: 3),
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green,
          colorText: Colors.black);
     }).catchError((error, stackTrace) {
      Get.snackbar("Kesalahan", "Terjadi Kesalahan saat menyimpan data", duration: Duration(seconds: 3),
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    });
  }

  Future<void>  deleteBookListByDoc(String doc) async {
    await bookListUser.doc(doc).delete().whenComplete(()  {
      Get.snackbar("Berhasil", "Berhasil Menghapus Buku", duration: Duration(seconds: 3),
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green,
          colorText: Colors.black);
    }).catchError((error, stackTrace) {
      Get.snackbar("Kesalahan", "Terjadi Kesalahan saat menghapus data", duration: Duration(seconds: 3),
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    });;
  }

  void deleteBookList(List<dynamic> data) {
    for(var entry in data) {
      bookListUser.doc(entry["book_list_id"]).delete();
    }
  }

  Stream<List<Map<String, dynamic>>> getAllBookListUser() {
    return bookListUser.snapshots().asyncMap((event) async {
      List<Map<String, dynamic>> result = [];

      for (var e in event.docs) {
        Map<String, dynamic> mapToBookListUser = {
          "book_list_id": e.data()["book_list_id"],
          "book_id": e.data()["book_id"],
        };

        var snapshot = await bookList
            .where("book_id", isEqualTo: e.data()["book_id"])
            .get();

          
        snapshot.docs.forEach((element) {
          mapToBookListUser["book_name"] = element.data()["book_name"];
          mapToBookListUser["book_author"] = element.data()["book_author"];
          mapToBookListUser["book_description"] =
              element.data()["book_description"];
          mapToBookListUser["book_image"] = element.data()["book_image"];
          mapToBookListUser["book_pages"] = element.data()["book_pages"];
          mapToBookListUser["book_rating"] = element.data()["book_rating"];
          mapToBookListUser["book_view"] = element.data()["book_view"];
        });

        result.add(mapToBookListUser);
      }

      return result;
    });
  }
}

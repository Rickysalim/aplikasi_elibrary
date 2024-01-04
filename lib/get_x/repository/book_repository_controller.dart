import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_library_nama_elib_mobile/models/Book.dart';
import 'package:get/get.dart';

class BookRepositoryController extends GetxController {
  static BookRepositoryController get instance => Get.find();

  final _db = FirebaseFirestore.instance.collection('Book');

  Future<List<Book>> getBookByRating(int? maxRating, int limit) async {
    try { 
      final  snapshots = await _db
          .where("book_rating", isGreaterThanOrEqualTo: maxRating)
          .limit(limit)
          .get();
      final bookData = snapshots.docs.map((e) => Book.fromSnapshot(e)).toList();
      return bookData;
    } on FirebaseException catch (e) {
      throw e;
    }
  }

  Future<List<Book>> getBookByView(int? maxView, int limit) async {
    try {

      final snapshots = await _db
          .where("book_view", isGreaterThanOrEqualTo: maxView)
          .limit(limit)
          .get();
       
      final bookData = snapshots.docs.map((e) => Book.fromSnapshot(e)).toList();
      return bookData;
    } on FirebaseException catch (e) {
      throw e;
    }
  }

  Future<Book> getBookDetail(String bookId) async {
     try {
      final snapshots = await _db.doc(bookId).get();
      return Book.fromSnapshot(snapshots);
    } on FirebaseException catch (e) {
      throw e;
    }
  }


}

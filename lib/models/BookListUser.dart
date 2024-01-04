import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_library_nama_elib_mobile/models/Book.dart';

class BookListUser {
   BookListUser({
    this.book_list_id = "",
    this.book_id = "",
   });

   String? book_list_id;
   String? book_id;

  factory BookListUser.fromBook(Book book) {
    return BookListUser(book_id: book.book_id);
  }

  factory BookListUser.fromSnapshot(DocumentSnapshot<Map<String,dynamic>> document) { 
    final data = document.data()!;   
    return BookListUser(
      book_list_id: document.id,
      book_id: data["book_id"]);
  }

  Map<String, dynamic> toMap () => {
    "book_list_id": book_list_id,
    "book_id": book_id
  };
}


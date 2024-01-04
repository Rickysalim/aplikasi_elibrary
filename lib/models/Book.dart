import 'package:cloud_firestore/cloud_firestore.dart';

class Book {
  Book({
    this.book_id = "",
    this.book_image = "",
    this.book_name = "",
    this.book_author = "",
    this.book_rating = null,
    this.book_pages = 0,
    this.book_view = 0,
    this.book_description = "",
    this.book_category = "",
    this.book_pdf_url = ""
  });

  String? book_id;
  String? book_image;
  String? book_name;
  String? book_author;
  String? book_category;
  dynamic book_rating;
  int? book_pages;
  int? book_view;
  String? book_description;
  String? book_pdf_url;

  factory Book.fromSnapshot(DocumentSnapshot<Map<String,dynamic>> document) { 
    final data = document.data()!;   
    return Book(
      book_id: document.id,
      book_image: data["book_image"],
      book_name: data["book_name"],
      book_author: data["book_author"],
      book_rating: data["book_rating"],
      book_pages: data["book_pages"],
      book_view: data["book_view"],
      book_description: data["book_description"],
      book_pdf_url: data["book_pdf_url"]);
  }

  factory Book.fromJson(Map<String, dynamic> json) => Book(
        book_image: json["book_image"],
        book_name: json["book_name"],
        book_author: json["book_author"],
        book_rating: json["book_rating"],
        book_pages: json["book_pages"],
        book_view: json["book_view"],
        book_description: json["book_description"],
        book_pdf_url: json["book_pdf_url"],
      );

  Map<String, dynamic> toJson() => {
        "book_image": book_image,
        "book_name": book_name,
        "book_author": book_author,
        "book_rating": book_rating,
        "book_pages": book_pages,
        "book_view": book_view,
        "book_description": book_description,
        "book_pdf_url": book_pdf_url,
      };
}

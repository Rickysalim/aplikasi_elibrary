import 'package:e_library_nama_elib_mobile/get_x/repository/book_list_user_repository.dart';
import 'package:e_library_nama_elib_mobile/models/Book.dart';
import 'package:e_library_nama_elib_mobile/models/BookListUser.dart';
import 'package:get/get.dart';

class BookListUserOnCheck {
  BookListUserOnCheck(
      {this.book_list_id = "",
      this.book_id = "",
      this.book_checked = false,
      this.book_image = "",
      this.book_name = "",
      this.book_author = "",
      this.book_rating = null,
      this.book_pages = 0,
      this.book_view = 0,
      this.book_description = "",
      this.book_category = ""});

  String? book_list_id;
  String? book_id;
  bool book_checked;
  String? book_image;
  String? book_name;
  String? book_author;
  String? book_category;
  dynamic book_rating;
  int? book_pages;
  int? book_view;
  String? book_description;

  factory BookListUserOnCheck.fromMap(Map<String, dynamic> data) {
    return BookListUserOnCheck(
      book_list_id: data["book_list_id"],
      book_id: data["book_id"],
      book_checked: data["book_checked"],
      book_image: data["book_list_id"],
      book_name: data["book_list_id"],
      book_author: data["book_list_id"],
      book_category: data["book_list_id"],
      book_rating: data["book_list_id"],
      book_pages: data["book_list_id"],
      book_view: data["book_list_id"],
      book_description: data["book_list_id"],
    );
  }
}

class BookListUserController extends GetxController {
  static BookListUserController get instance => Get.find();

  RxBool isActiveLongPress = RxBool(false);

  RxList setListOptions = RxList([]);

  RxBool isDataFetched = RxBool(false);

  RxBool alreadyExists = RxBool(false);

  RxString book_id = RxString("");

  RxString book_list_id = RxString("");

  Future<void> addBookList(Book book) async {
     final data = BookListUser.fromBook(book);
     await bookListUserRepositoryController.addBookListUser(data);
  }

  
  Future<void> deleteBookListByDoc() async {
     await bookListUserRepositoryController.deleteBookListByDoc(book_list_id.value);
     book_list_id.value = "";
     alreadyExists.value = false;
     update();
  }

  void setBookId(String bookId) {
    book_id.value = bookId;
    onInit();
  }

  @override
  void onInit() {
    super.onInit();
    getAllBookListUser().listen((event) {
       bool exists = false; 

    for (var newItem in event) {
      if (newItem["book_id"] == book_id.value) {
        book_list_id.value = newItem["book_list_id"];
        exists = true;
        break; 
      }
    }

    if (exists) {
      alreadyExists.value = true;
    }

    update();
    });
  }

  void clearAll() {
    isActiveLongPress.value = false;
    setListOptions.clear();
    alreadyExists.value = false;
    book_id.value = "";
    book_list_id.value = "";
    update();
  }

  int countChecklist() {
    int count = 0;

    if (setListOptions.isEmpty) {
      return 0;
    }

    for (var data in setListOptions.value) {
      if (data["book_checked"]) {
        count++;
      }
    }

    return count;
  }

  void checkedListOption(int index) {
    if (index >= 0 && index < setListOptions.length) {
      setListOptions[index]["book_checked"] = true;
      update();
    }
  }

  void uncheckedListOption(int index) {
    if (index >= 0 && index < setListOptions.length) {
      setListOptions[index]["book_checked"] = false;
      update();
    }
  }

  void setLongPress() {
    isActiveLongPress.value = !isActiveLongPress.value;
    update();
  }

  @override
  void onClose() {
    super.onClose();
    isActiveLongPress.value = false;
    setListOptions.clear();
    alreadyExists.value = false;
    book_id.value = "";
    book_list_id.value = "";
    update();
  }

  final bookListUserRepositoryController =
      Get.put(BookListUserRepositoryController());

  void setOptions(List<Map<String, dynamic>> data) {
    data.forEach((newItem) {
      bool alreadyExists = setListOptions
          .any((element) => element["book_id"] == newItem["book_id"]);
      if (!alreadyExists) {
        setListOptions.add({
          "book_list_id": newItem["book_list_id"],
          "book_id": newItem["book_id"],
          "book_checked": false
        });
      } else if (setListOptions.isEmpty) {
        setListOptions.add({
          "book_list_id": newItem["book_list_id"],
          "book_id": newItem["book_id"],
          "book_checked": false
        });
      }
    });
  }

  Stream<List<Map<String, dynamic>>> getAllBookListUser() =>
      bookListUserRepositoryController.getAllBookListUser();

  void deleteBookList() {
    print(setListOptions.length);
    final dataToDelete = setListOptions.where((p0) {
      return p0["book_checked"] == true;
    });
    // print(dataToDelete.toList());
    bookListUserRepositoryController.deleteBookList(dataToDelete.toList());
  }
}

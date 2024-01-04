
import 'package:e_library_nama_elib_mobile/get_x/repository/book_repository_controller.dart';
import 'package:e_library_nama_elib_mobile/models/Book.dart';
import 'package:get/get.dart';

class BookController extends GetxController {
  static BookController get instance => Get.find();

  final _bookRepoController = Get.put(BookRepositoryController());

  Future<List<Book>> getBookByRating() async => await _bookRepoController.getBookByRating(3, 10); 

  Future<List<Book>> getBookByView() async => await _bookRepoController.getBookByView(200, 10); 
  
  
}
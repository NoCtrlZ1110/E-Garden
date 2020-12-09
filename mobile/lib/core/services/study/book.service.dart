import 'package:e_garden/application.dart';
import 'package:e_garden/core/models/study/book/book.dart';
import 'package:e_garden/utils/exception.dart';

class BookService {
  static Future<Book> fetchBookDetail(Map<String, dynamic> params) async {
    final response = await Application.api
        .get("api/services/app/Study/GetBookDetail", params);
    print(params);
    if (response.statusCode == 200) {
      Book _book =
          await Book.fromJson(response.data['result'] as Map<String, dynamic>);
      return _book;
    } else {
      throw NetworkException;
    }
  }

  static Future<ListBook> fetchListBook() async {
    final response =
        await Application.api.get("api/services/app/Study/GetListBook");
    if (response.statusCode == 200) {
      ListBook _listBook = await ListBook.fromJson(
          response.data['result'] as Map<String, dynamic>);
      return _listBook;
    } else {
      throw NetworkException;
    }
  }
}

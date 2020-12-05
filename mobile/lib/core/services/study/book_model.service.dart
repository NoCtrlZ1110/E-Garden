import 'package:e_garden/application.dart';
import 'package:e_garden/core/models/study/book/book.dart';
import 'package:e_garden/utils/exception.dart';
import 'package:flutter/cupertino.dart';

class BookModel extends ChangeNotifier {
  Book _book;
  ListBook _listBook;

  Future<Book> fetchBookDetail(Map<String, dynamic> params) async {
    final response = await Application.api
        .get("api/services/app/Study/GetBookDetail", params);
    print(params);
    if (response.statusCode == 200) {
      _book =
          await Book.fromJson(response.data['result'] as Map<String, dynamic>);
      return _book;
    } else {
      throw NetworkException;
    }
  }

  Future<ListBook> fetchListBook() async {
    final response =
        await Application.api.get("api/services/app/Study/GetListBook");
    if (response.statusCode == 200) {
      _listBook = await ListBook.fromJson(
          response.data['result'] as Map<String, dynamic>);
      return _listBook;
    } else {
      throw NetworkException;
    }
  }

  Book get book => _book;

  set book(Book value) {
    _book = value;
  }

  ListBook get listBook => _listBook;

  set listBook(ListBook value) {
    _listBook = value;
  }
}

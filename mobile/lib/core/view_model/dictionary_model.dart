import 'package:e_garden/core/models/dictionary/dictionary.dart';
import 'package:flutter/cupertino.dart';
import 'package:e_garden/application.dart';

class DictionaryModel extends ChangeNotifier {
  DictionaryModel();
  Dictionary dictionary;

  Future<Dictionary> fetchWord(String _word) async {
    final response = await Application.api.dio.get(
      'https://api.dictionaryapi.dev/api/v2/entries/en/${_word}',
    );
    if (response.statusCode == 200) {
      var mapResponse = response.data;
      dictionary = Dictionary.fromJson(response.data[0] as Map<String,dynamic>);
      print(dictionary.toJson());
      return dictionary;
    } else {
      throw Exception('Failed to load');
    }
  }
}

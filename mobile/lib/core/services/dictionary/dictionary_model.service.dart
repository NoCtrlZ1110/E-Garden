import 'package:e_garden/core/models/dictionary/dictionary.dart';
import 'package:flutter/cupertino.dart';
import 'package:e_garden/application.dart';

class DictionaryModel extends ChangeNotifier {
  Dictionary _dictionary;
  String _type_word;
  List<Meanings_Word> _definitions;
  List<String> _synonyms;

  Future<Dictionary> fetchWord(String _word) async {
    final response = await Application.api.dio.get(
      'https://api.dictionaryapi.dev/api/v2/entries/en/$_word',
    );
    _type_word = "";
    if (response.statusCode == 200) {
      _dictionary =
          await Dictionary.fromJson(response.data[0] as Map<String, dynamic>);
      for (Meanings m in _dictionary.meanings) {
        _type_word += m.partOfSpeech + ", ";
      }
      _type_word = _type_word.substring(0, _type_word.length - 2);
      _definitions = await fetchDefination(_dictionary);
      _synonyms = fetchSynonyms(_dictionary);
      return _dictionary;
    } else {
      throw Exception('Failed to load');
    }
  }

  Future<List<Meanings_Word>> fetchDefination(Dictionary _dictionary) async {
    _definitions = [];
    for (Meanings m in _dictionary.meanings) {
      for (Definitions d in m.definitions) {
        await _definitions.add(new Meanings_Word(d.definition, d.example));
      }
    }
    return _definitions;
  }

  List<String> fetchSynonyms(Dictionary _dictionary) {
    _synonyms = [];
    for (Meanings m in _dictionary.meanings) {
      for (Definitions d in m.definitions) {
        if (d.synonyms != null) {
          for (String s in d.synonyms) {
            if (!s.contains(" ")) {
              _synonyms.add(s);
            }
          }
        }
      }
    }
    return _synonyms;
  }

  Dictionary get dictionary => _dictionary;

  set dictionary(Dictionary value) {
    _dictionary = value;
    notifyListeners();
  }

  String get type_word => _type_word;

  set type_word(String value) {
    _type_word = value;
  }

  List<String> get synonyms => _synonyms;

  set synonyms(List<String> value) {
    _synonyms = value;
  }

  List<Meanings_Word> get definitions => _definitions;

  set definitions(List<Meanings_Word> value) {
    _definitions = value;
  }

  DictionaryModel() {
    _type_word = "";
  }
}

class Meanings_Word {
  String _definition;
  String _example;

  String get definition => _definition;

  set definition(String value) {
    _definition = value;
  }

  Meanings_Word(this._definition, this._example);

  String get example => _example;

  set example(String value) {
    _example = value;
  }
}

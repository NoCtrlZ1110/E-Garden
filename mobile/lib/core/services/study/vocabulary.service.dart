import 'package:e_garden/application.dart';
import 'package:e_garden/core/models/study/vocabulary/vocabulary.dart';
import 'package:e_garden/utils/exception.dart';
import 'package:flutter/cupertino.dart';

class VocabularyService extends ChangeNotifier {

  static Future<ListVocabulary> fetchUnitVocab(Map<String, dynamic> params) async {
    final response = await Application.api
        .get("api/services/app/Study/GetListVocabulary", params);
    if (response.statusCode == 200) {
      ListVocabulary _listvocab = await ListVocabulary.fromJson(
          response.data['result'] as Map<String, dynamic>);
      return _listvocab;
    } else {
      throw NetworkException;
    }
  }
}

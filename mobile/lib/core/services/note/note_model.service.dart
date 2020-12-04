import 'package:e_garden/application.dart';
import 'package:e_garden/core/models/notes/notes.dart';
import 'package:e_garden/utils/exception.dart';
import 'package:flutter/cupertino.dart';

class NoteModel extends ChangeNotifier {
  Notes _listNote;

  Notes get listNote => _listNote;

  set listNote(Notes value) {
    _listNote = value;
  }

  Future<Notes> fetchListNote(Map<String, dynamic> params) async {
    final response = await Application.api.get("/api/services/app/UserNote/CreateOrUpdateNote", params);
    print(params);
    if (response.statusCode == 200) {
      _listNote = await Notes.fromJson(response.data['result'] as Map<String, dynamic>);
      return _listNote;
    } else {
      throw NetworkException;
    }
  }
}

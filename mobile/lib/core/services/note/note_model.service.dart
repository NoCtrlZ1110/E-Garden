import 'package:e_garden/application.dart';
import 'package:e_garden/core/models/notes/notes.dart';
import 'package:e_garden/utils/exception.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart'; // for date format

class NoteModel extends ChangeNotifier {
  Notes _listNote;
  Note _noteDetail;

  Notes get listNote => _listNote;
  Map<String, dynamic> _params = null;
  List<String> status = [ "Uncomplete","Complete"];

  set listNote(Notes value) {
    _listNote = value;
  }

  Map<String, dynamic> get params => _params;

  Note get noteDetail => _noteDetail;

  set noteDetail(Note value) {
    _noteDetail = value;
  }

  set params(Map<String, dynamic> value) {
    _params = value;
    notifyListeners();
  }

  Future<Notes> fetchListNote(Map<String, dynamic> params) async {
    final response = await Application.api
        .get("api/services/app/UserNote/GetListNoteByUser", params);
    print(params);
    if (response.statusCode == 200) {
      _listNote =
          await Notes.fromJson(response.data['result'] as Map<String, dynamic>);
      return _listNote;
    } else {
      throw NetworkException(
          message: Map<String, dynamic>.from(
              response.data["error"] as Map<dynamic, dynamic>));
    }
  }

  Future<bool> createNote(Map<String, dynamic> data, int noteId) async {
    print(data);
    Map<String, dynamic> paramss = {
      "userId": Application.sharePreference.getInt('userId').toString(),
      "date": DateFormat.yMd()
          .format(DateTime.parse(data["activity_date"].toString())),
      "startTime":
          DateFormat.Hm().format(DateTime.parse(data["time_from"].toString())),
      "endTime":
          DateFormat.Hm().format(DateTime.parse(data["time_to"].toString())),
      "titleNote": data["title"],
      "detailNote": data["note_detail"],
      "status": data["status"].toString() == "Complete" ? true : false,
      "hexcode": data["color_picker"].toString().substring(10, 16),
      "id": noteId
    };
    print(paramss);
    final response = await Application.api
        .post("api/services/app/UserNote/CreateOrUpdateNote", paramss);
    if (response.statusCode == 200) {
      return true;
    } else {
      throw NetworkException(
          message: Map<String, dynamic>.from(
              response.data["error"] as Map<dynamic, dynamic>));
    }
  }

  Future<Note> fetchNoteDetail(int noteId) async {
    if (noteId != 0) {
      final response = await Application.api
          .get("api/services/app/UserNote/GetDetailNote", {"noteId": noteId});
      if (response.statusCode == 200) {
        _noteDetail = await Note.fromJson(
            response.data['result'] as Map<String, dynamic>);
        print(_noteDetail.toString());
        return _noteDetail;
      } else {
        throw NetworkException(
            message: Map<String, dynamic>.from(
                response.data["error"] as Map<dynamic, dynamic>));
      }
    }
    return null;
  }

  Future<bool> setNoteDone(bool status, int noteId) async {
    notifyListeners();
    Map<String, dynamic> paramss = {
      "status": status,
      "id": noteId,
    };
    final response = await Application.api
        .post("api/services/app/UserNote/SetDoneNoteStatus", paramss);
    if (response.statusCode == 200) {
      return true;
    } else {
      throw NetworkException(
          message: Map<String, dynamic>.from(
              response.data["error"] as Map<dynamic, dynamic>));
    }
  }
}

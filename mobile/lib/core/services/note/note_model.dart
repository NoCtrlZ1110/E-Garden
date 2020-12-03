import 'package:flutter/cupertino.dart';

class NoteModel extends ChangeNotifier{
  List<Note> _listNote;
}
class Note {
  String title;
  String detail;
  bool isDone;
}
import 'package:flutter/cupertino.dart';

class BookModel extends ChangeNotifier{
  int _current = 0;
  getGrade() => _current;

  setGrade(int value){
    _current = value;
    notifyListeners();
  }
}
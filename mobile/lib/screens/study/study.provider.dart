import 'package:flutter/cupertino.dart';

class BookModel extends ChangeNotifier{
  int _current = 0;
  getGrade() => _current;

  setGrade(int value){
    _current = value;
    notifyListeners();
  }

  bool _isPlaying = false;
  get  isPlaying => _isPlaying;
  void play(){
    _isPlaying = !_isPlaying;
    notifyListeners();
  }
}
import 'package:flutter/material.dart';

class HomeModel extends ChangeNotifier {
  int _selectedItem = 0;
  get selectedItem => _selectedItem;

  void changeItem(int value){
    _selectedItem = value;
    notifyListeners();
  }
}
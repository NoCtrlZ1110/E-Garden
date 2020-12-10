import 'package:flutter/cupertino.dart';
import 'package:e_garden/core/models/study/unit/unit.dart';
import 'package:e_garden/core/services/study/unit.service.dart';

class BookModel extends ChangeNotifier {
  int _current = 0;

  getGrade() => _current;
  int _unit;
  ListUnit _listUnit;
  Unit _unitDetail;

  int _unitIndex = 1;
  get unitIndex => _unitIndex;
  void setUnitIndex(int value){
    _unitIndex = value;
    notifyListeners();
  }

  get unit => _unit;

  set unit(int value) {
    _unit = value;
    notifyListeners();
  }

  ListUnit get listUnit => _listUnit;

  set listUnit(ListUnit value) {
    _listUnit = value;
    notifyListeners();
  }

  void changeUnit(value) {
    _unit = value;
    notifyListeners();
  }

  Future<ListUnit> fetchListUnit(int params) async {
    _listUnit = await UnitService.fetchListUnit({"bookId":params});
    return _listUnit;
  }

  Future<Unit> fetchUnitDetail(int unitId) async {
    _unitDetail = await UnitService.fetchUnitDetail({"unitId": unitId});
    print("_________________________");
    return _unitDetail;
  }

  setGrade(int value) {
    _current = value;
    notifyListeners();
  }

  bool _isPlaying = false;

  get isPlaying => _isPlaying;

  void play() {
    _isPlaying = !_isPlaying;
    notifyListeners();
  }

  Unit get unitDetail => _unitDetail;

  set unitDetail(Unit value) {
    _unitDetail = value;
    notifyListeners();
  }
}

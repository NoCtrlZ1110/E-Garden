import 'package:flutter/cupertino.dart';
import 'package:e_garden/core/models/study/unit/unit.dart';
import 'package:e_garden/core/services/study/unit.service.dart';

class BookModel extends ChangeNotifier {
  int _current = 0;

  getGrade() => _current;
  int _unit = 1;
  ListUnit _listUnit;
  Unit _unitDetail;

  get unit => _unit;

  ListUnit get listUnit => _listUnit;

  set listUnit(ListUnit value) {
    _listUnit = value;
    notifyListeners();
  }

  void changeUnit(value) {
    _unit = value;
    notifyListeners();
  }

  Future<ListUnit> fetchListUnit(Map<String, dynamic> params) async {
    _listUnit = await UnitService.fetchListUnit(params);
    return _listUnit;
  }

  Future<Unit> fetchUnitDetail() async {
    _unitDetail = await UnitService.fetchUnitDetail({"unitId": _unit});
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

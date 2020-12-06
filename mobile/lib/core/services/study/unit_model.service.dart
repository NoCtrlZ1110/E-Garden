import 'package:e_garden/application.dart';
import 'package:e_garden/core/models/study/unit/unit.dart';
import 'package:e_garden/utils/exception.dart';
import 'package:flutter/cupertino.dart';

class UnitModel extends ChangeNotifier {
  ListUnit _listUnit;
  Unit _unitDetail;

  Future<ListUnit> fetchListUnit(Map<String, dynamic> params) async {
    final response =
        await Application.api.get("api/services/app/Study/GetListUnit", params);
    if (response.statusCode == 200) {
      _listUnit = await ListUnit.fromJson(
          response.data['result'] as Map<String, dynamic>);
      return _listUnit;
    } else {
      throw NetworkException;
    }
  }

  Future<Unit> fetchUnitDetail(Map<String, dynamic> params) async {
    final response =
        await Application.api.get("api/services/app/Study/GetUnitDetail", params);
    if (response.statusCode == 200) {
      _unitDetail =
          await Unit.fromJson(response.data['result'] as Map<String, dynamic>);
      return _unitDetail;
    } else {
      throw NetworkException;
    }
  }

  ListUnit get listUnit => _listUnit;

  set listUnit(ListUnit value) {
    _listUnit = value;
  }

  Unit get unitDetail => _unitDetail;

  set unitDetail(Unit value) {
    _unitDetail = value;
  }
}

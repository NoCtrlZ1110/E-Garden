import 'package:e_garden/application.dart';
import 'package:e_garden/core/models/study/unit/unit.dart';
import 'package:e_garden/utils/exception.dart';
import 'package:flutter/cupertino.dart';

 class UnitService {
  static Future<dynamic> fetchListUnit(Map<String, dynamic> params) async {
    final response =
        await Application.api.get("api/services/app/Study/GetListUnit", params);
    if (response.statusCode == 200) {
      ListUnit _listUnit = await ListUnit.fromJson(
          response.data['result'] as Map<String, dynamic>);
      return _listUnit;
    } else {
      throw NetworkException;
    }
  }

  static Future<dynamic> fetchUnitDetail(Map<String, dynamic> params) async {
    final response = await Application.api
        .get("api/services/app/Study/GetUnitDetail", params);
    if (response.statusCode == 200) {
      print(response);
      Unit _unitDetail =
          await Unit.fromJson(response.data['result'] as Map<String, dynamic>);
      return _unitDetail;
    } else {
      throw NetworkException;
    }
  }
}

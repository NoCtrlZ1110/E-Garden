import 'package:e_garden/application.dart';
import 'package:e_garden/core/models/user/user.dart';
import 'package:e_garden/utils/exception.dart';
import 'package:flutter/cupertino.dart';

class UserModel extends ChangeNotifier {
  User user;

  Future<User> login(Map<String, dynamic> params) async {
    final response = await Application.api.post('/api/TokenAuth/Authenticate', params);
    if (response.statusCode == 200) {
      user = await User.fromJson(response.data["result"] as Map<String, dynamic>);
      return user;
    }
    else {
      throw NetworkException(message: Map<String, dynamic>.from(response.data["error"] as Map<dynamic, dynamic>));
    };
  }
}
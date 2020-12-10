import 'package:e_garden/application.dart';
import 'package:e_garden/core/models/user/user.dart';
import 'package:e_garden/utils/exception.dart';

class Login {
  static Future<void> loginUser(Map<String, dynamic> data) async {
    Map<String, dynamic> params = {
      "userNameOrEmailAddress": data['user_name'],
      "password": data['password']
    };
    final response =
        await Application.api.post('api/TokenAuth/Authenticate/', params);
    try {
      if (response.statusCode == 200) {
        Application.user =
            User.fromJson(response.data["result"] as Map<String, dynamic>);
        Application.sharePreference
          ..putInt('userId', response.data['result']['userId']);
        Application.sharePreference
          ..putString('accessToken', response.data['result']['accessToken']);
      } else {
        throw NetworkException(
            message: Map<String, dynamic>.from(
                response.data["error"] as Map<dynamic, dynamic>));
      }
    } on NetworkException catch (e) {
      throw NetworkException(
          message: Map<String, dynamic>.from(
              response.data["error"] as Map<dynamic, dynamic>));
    }
  }

  static Future<bool> signupUser(Map<String, dynamic> data) async {
    Map<String, dynamic> params = {
      "userName": data['user_name'],
      "name": data['full_name'],
      "surname":  data['full_name'],
      "emailAddress": "${data['user_name']}@example.com",
      "isActive": true,
      "password": data['password'],
    };
    print(data);
    print(params);
    final response =
        await Application.api.post('api/services/app/User/Create', params);
    try {
      if (response.statusCode == 200) {
        return true;
      } else {
        throw NetworkException(
            message: Map<String, dynamic>.from(
                response.data["error"] as Map<dynamic, dynamic>));
      }
    } on NetworkException catch (e) {
      throw NetworkException(
          message: Map<String, dynamic>.from(
              response.data["error"] as Map<dynamic, dynamic>));
    }
  }
}

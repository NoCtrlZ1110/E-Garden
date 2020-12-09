import 'package:e_garden/application.dart';
import 'package:e_garden/core/models/user/user.dart';
import 'package:e_garden/utils/exception.dart';

class Login{
  static Future<void> loginUser(Map<String, dynamic> data) async {
    Map<String, dynamic> params = {"userNameOrEmailAddress": data['user_name'], "password": data['password']};
    final response = await Application.api.post('api/TokenAuth/Authenticate/', params);
    print(params);
    print(data);
    try {
      if (response.statusCode == 200) {
        Application.user = User.fromJson(response.data["result"] as Map<String, dynamic>);
        Application.sharePreference..putInt('userId', response.data['result']['userId']);
        Application.sharePreference..putString('accessToken', response.data['result']['accessToken']);
      } else {
        print('Fetch Data Login Error!');
      }
    } on NetworkException catch (e) {
      print('Network Error!');
    }
  }
}

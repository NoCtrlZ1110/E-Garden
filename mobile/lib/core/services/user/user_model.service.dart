import 'package:e_garden/application.dart';
import 'package:e_garden/core/models/user/user.dart';
import 'package:e_garden/utils/exception.dart';
import 'package:flutter/cupertino.dart';

enum Status { Uninitialized, Authenticated, Authenticating, Unauthenticated }

class UserModel extends ChangeNotifier {
  User _user;
  Status _status = Status.Uninitialized;
  String _message;

  User get user => _user;

  String get message => _message;

  set message(String value) {
    _message = value;
  }

  set user(User value) {
    _user = value;
  }

  Future<User> authenticate(Map<String, dynamic> params) async {
    final response =
        await Application.api.post('/api/TokenAuth/Authenticate/', params);
    if (response.statusCode == 200) {
      _user =
          await User.fromJson(response.data["result"] as Map<String, dynamic>);
      return user;
    } else {
      _status = Status.Unauthenticated;
      notifyListeners();
      throw NetworkException(
          message: Map<String, dynamic>.from(
              response.data["error"] as Map<dynamic, dynamic>));
    }
  }

  Future<bool> login(Map<String, dynamic> data) async {
    Map<String, dynamic> params = {"userNameOrEmailAddress": data['user_name'], "password": data['password'],"rememberClient": true };
    try {
      _status = Status.Authenticating;
      notifyListeners();
      User usr = await authenticate(params);
      Application.sharePreference
        ..putString('token', usr.accessToken)
        ..putString('encryptedAccessToken', usr.encryptedAccessToken)
        ..putInt('userId', usr.userId)
        ..putInt('expireInSeconds', usr.expireInSeconds);
      _status = Status.Authenticated;
      notifyListeners();
      return true;
    } on NetworkException catch (e) {
      _status = Status.Unauthenticated;
      notifyListeners();
      _message =
          e.message["message"] != null ? e.message["message"] as String : "";
      print(_message);
      return false;
    }
  }

  Status get status => _status;

  set status(Status value) {
    _status = value;
  }
}

import 'package:flutter/cupertino.dart';

enum Status { Uninitialized, Authenticated, Authenticating, Unauthenticated }

class UserModel extends ChangeNotifier {
  String userName = 'xuannguyen';
  String name = 'Nguyen Xuan';
  String email = "xuan123dthhbg@gmail.com";
  int age = 20;

  Status _status = Status.Uninitialized;

  set status(Status value) {
    _status = value;
    notifyListeners();
  }

  get status => _status;
}

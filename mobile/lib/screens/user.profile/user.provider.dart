import 'package:flutter/cupertino.dart';

enum Status { Uninitialized, Authenticated, Authenticating, Unauthenticated }
enum StatusSignIn { Uninitialized, SignIned, SignIning, UnSignIned }

class UserModel extends ChangeNotifier {
  String userName = 'xuannguyen';
  String name = 'Nguyen Xuan';
  String email = "xuan123dthhbg@gmail.com";
  int age = 20;

  Status _status = Status.Uninitialized;
  StatusSignIn _statusSignIn = StatusSignIn.Uninitialized;

  StatusSignIn get statusSignIn => _statusSignIn;

  set statusSignIn(StatusSignIn value) {
    _statusSignIn = value;
  }

  set status(Status value) {
    _status = value;
    notifyListeners();
  }

  get status => _status;
}

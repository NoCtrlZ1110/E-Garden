import 'package:e_garden/configs/AppConfig.dart';
import 'package:e_garden/core/services/user/user_model.service.dart';
import 'package:e_garden/screens/home.dart';
import 'package:e_garden/screens/user.profile/user.provider.dart';
import 'package:e_garden/widgets/custom_buton_component.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../application.dart';

class SignIn extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SignInState();
  }
}

class _SignInState extends State<SignIn> {
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  bool switcherValue = false;
  bool review = false;
  Map<String, dynamic> params;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView(
      child: FormBuilder(
        key: _fbKey,
        child: Column(
          children: [
            Container(
              height: SizeConfig.blockSizeVertical * 50,
              width: SizeConfig.screenWidth,
              child: Stack(
                children: [
                  Image.asset(
                    'assets/images/header.png',
                    height: SizeConfig.blockSizeVertical * 50,
                    fit: BoxFit.fill,
                  ),
                  Container(
                    height: SizeConfig.blockSizeVertical * 50,
                    width: SizeConfig.screenWidth,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Image.asset(
                          'assets/images/logoApp.png',
                          height: SizeConfig.blockSizeVertical * 20,
                        ),
                        Text(
                          "E-Garden",
                          style: TextStyle(fontSize: 50, color: Colors.white, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: SizeConfig.screenHeight * 0.5,
              width: SizeConfig.screenWidth,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: SizeConfig.safeBlockHorizontal * 80,
                    child: FormBuilderTextField(
                      attribute: "user_name",
                      validators: [FormBuilderValidators.required()],
                      style: TextStyle(fontSize: SizeConfig.safeBlockVertical * 2.5, color: AppColors.green),
                      // controller: _username,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.account_circle,
                          color: AppColors.mainGreen,
                        ),
                        contentPadding: EdgeInsets.only(
                            left: SizeConfig.safeBlockHorizontal * 5,
                            right: SizeConfig.safeBlockHorizontal * 3,
                            top: SizeConfig.safeBlockVertical * 2,
                            bottom: SizeConfig.safeBlockVertical * 2),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(
                            color: AppColors.border,
                            width: 2.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(
                            color: AppColors.border,
                            width: 2.0,
                          ),
                        ),
                        labelText: "Username",
                        hintText: "Enter Username",
                        alignLabelWithHint: false,
                        labelStyle:
                            TextStyle(fontSize: SizeConfig.safeBlockVertical * 2.5, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: SizeConfig.safeBlockHorizontal * 80,
                    child: FormBuilderTextField(
                      validators: [FormBuilderValidators.required()],
                      attribute: "password",
                      style: TextStyle(fontSize: SizeConfig.safeBlockVertical * 2.5, color: AppColors.green),
                      obscureText: !review,
                      // controller: _password,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.vpn_key_rounded,
                          color: AppColors.mainGreen,
                        ),
                        suffixIcon: IconButton(
                          icon: !review ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
                          onPressed: () {
                            setState(() {
                              review = !review;
                            });
                          },
                        ),
                        contentPadding: EdgeInsets.only(
                            left: SizeConfig.safeBlockHorizontal * 5,
                            right: SizeConfig.safeBlockHorizontal * 3,
                            top: SizeConfig.safeBlockVertical * 2,
                            bottom: SizeConfig.safeBlockVertical * 2),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(
                            color: AppColors.border,
                            width: 2.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(
                            color: AppColors.border,
                            width: 2.0,
                          ),
                        ),
                        labelText: "Password",
                        alignLabelWithHint: false,
                        labelStyle: TextStyle(
                            // color: AppTheme.buttonBlend2,
                            fontSize: SizeConfig.safeBlockVertical * 2.5,
                            fontWeight: FontWeight.w500),
                        hintText: "Enter Password",
                      ),
                    ),
                  ),
                  Container(
                    child: Consumer<UserModel>(
                        builder: (_, model, __) => (model.status != Status.Authenticating)
                            ? CustomButton(
                                child: Text(
                                  'SIGN IN',
                                  style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w800),
                                ),
                                radius: 30,
                                height: SizeConfig.blockSizeVertical * 6,
                                width: SizeConfig.blockSizeHorizontal * 30,
                                shadowColor: AppColors.btnShadow,
                                backgroundColor: AppColors.buttonColor,
                                onPressed: () async {
                                  model.status = Status.Authenticating;
                                  (_fbKey.currentState.saveAndValidate())
                                      ? Login.loginUser(_fbKey.currentState.value).then((value) => {
                                            if (Application.user.userId != null)
                                              {
                                                model.status = Status.Authenticated,
                                                Navigator.push(
                                                    context, MaterialPageRoute(builder: (context) => HomeScreen()))
                                              }
                                            else
                                              {
                                                model.status = Status.Unauthenticated,
                                                Fluttertoast.showToast(
                                                  msg: "Username or password error!",
                                                  toastLength: Toast.LENGTH_SHORT,
                                                  gravity: ToastGravity.BOTTOM,
                                                  timeInSecForIosWeb: 1,
                                                  backgroundColor: Colors.black45,
                                                  textColor: Colors.white,
                                                  fontSize: 16.0,
                                                )
                                              }
                                          })
                                      : Fluttertoast.showToast(
                                          msg: "Invalid value",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Colors.black45,
                                          textColor: Colors.white,
                                          fontSize: 16.0,
                                        );
                                },
                              )
                            : Center(
                                child: CircularProgressIndicator(),
                              )),
                  ),
                  Text(
                    'Not a member yet? Sign up now!',
                    style: TextStyle(
                        color: AppColors.green,
                        fontSize: SizeConfig.blockSizeVertical * 2,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

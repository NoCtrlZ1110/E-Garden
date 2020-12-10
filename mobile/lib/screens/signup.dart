import 'package:e_garden/application.dart';
import 'package:e_garden/configs/AppConfig.dart';
import 'package:e_garden/core/services/user/user_model.service.dart';
import 'package:e_garden/screens/user.profile/user.provider.dart';
import 'package:e_garden/widgets/button_green.dart';
import 'package:e_garden/widgets/custom_buton_component.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'signin.dart';

import 'home.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  bool switcherValue = false;
  bool review = false;
  Map<String, dynamic> params;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: FormBuilder(
          key: _fbKey,
          child: Column(
            children: [
              Container(
                height: SizeConfig.blockSizeVertical * 35,
                width: SizeConfig.screenWidth,
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/images/header.png',
                      height: SizeConfig.blockSizeVertical * 50,
                      width: SizeConfig.screenWidth,
                      fit: BoxFit.fill,
                    ),
                    Container(
                      height: SizeConfig.blockSizeVertical * 50,
                      width: SizeConfig.screenWidth,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset(
                            'assets/images/logoApp.png',
                            height: SizeConfig.blockSizeVertical * 15,
                          ),
                          Text(
                            "E-Garden",
                            style: TextStyle(fontSize: 40, color: Colors.white, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: SizeConfig.screenHeight * 0.65,
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
                        attribute: "full_name",
                        validators: [FormBuilderValidators.required()],
                        style: TextStyle(fontSize: SizeConfig.safeBlockVertical * 2.5, color: AppColors.green),
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
                          labelText: "Fullname",
                          hintText: "Enter Fullname",
                          alignLabelWithHint: false,
                          labelStyle: TextStyle(fontSize: SizeConfig.safeBlockVertical * 2.5, fontWeight: FontWeight.w500),
                        ),
                      ),
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
                          labelStyle: TextStyle(fontSize: SizeConfig.safeBlockVertical * 2.5, fontWeight: FontWeight.w500),
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
                          builder: (_, model, __) => (model.statusSignIn == StatusSignIn.SignIning)
                              ? Center(
                                  child: CircularProgressIndicator(),
                                )
                              : CustomButton(
                                  child: Text(
                                    'SIGN UP',
                                    style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w800),
                                  ),
                                  radius: 30,
                                  height: SizeConfig.blockSizeVertical * 6,
                                  width: SizeConfig.blockSizeHorizontal * 30,
                                  shadowColor: AppColors.btnShadow,
                                  backgroundColor: AppColors.buttonColor,
                                  onPressed: () async {
                                    model.statusSignIn = StatusSignIn.SignIning;
                                    if (_fbKey.currentState.saveAndValidate()) {
                                      if (Login.signupUser(_fbKey.currentState.value) != null) {
                                        model.statusSignIn = StatusSignIn.SignIned;
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => SignIn()));
                                      } else {
                                        model.statusSignIn = StatusSignIn.UnSignIned;
                                        Fluttertoast.showToast(
                                          msg: "Username already exists",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Colors.black45,
                                          textColor: Colors.white,
                                          fontSize: 16.0,
                                        );
                                      }
                                    }
                                    else {
                                      Fluttertoast.showToast(
                                        msg: "Invalid value",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.black45,
                                        textColor: Colors.white,
                                        fontSize: 16.0,
                                      );
                                    }
                                  },
                                )),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SignIn())),
                      child: Text(
                        'Go to Sign In',
                        style: TextStyle(color: AppColors.green, fontSize: SizeConfig.blockSizeVertical * 2, fontWeight: FontWeight.w600),
                      ),
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
      ),
    );
  }
}

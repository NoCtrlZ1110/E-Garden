import 'package:e_garden/configs/AppConfig.dart';
import 'package:e_garden/widgets/button_green.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _retype_password = TextEditingController();
  bool review = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 80,
              ),
              Image.asset(
                'assets/images/logoApp.png',
                height: SizeConfig.blockSizeVertical * 20,
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Sign Up",
                style: TextStyle(
                    fontSize: 35,
                    color: AppColors.green,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                width: SizeConfig.safeBlockHorizontal * 80,
                child: FormBuilderTextField(
                  controller: _username,
                  attribute: "user_name",
                  validators: [FormBuilderValidators.required()],
                  style: TextStyle(
                      fontSize: SizeConfig.safeBlockVertical * 2.5,
                      color: AppColors.green),
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
                    labelStyle: TextStyle(
                        fontSize: SizeConfig.safeBlockVertical * 2.5,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                width: SizeConfig.safeBlockHorizontal * 80,
                child: FormBuilderTextField(
                  controller: _password,
                  validators: [FormBuilderValidators.required()],
                  attribute: "password",
                  style: TextStyle(
                      fontSize: SizeConfig.safeBlockVertical * 2.5,
                      color: AppColors.green),
                  obscureText: !review,
                  // controller: _password,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.vpn_key_rounded,
                      color: AppColors.mainGreen,
                    ),
                    suffixIcon: IconButton(
                      icon: !review
                          ? Icon(Icons.visibility_off)
                          : Icon(Icons.visibility),
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
              SizedBox(
                height: 30,
              ),
              SizedBox(
                width: SizeConfig.safeBlockHorizontal * 80,
                child: FormBuilderTextField(
                  controller: _retype_password,
                  validators: [FormBuilderValidators.required()],
                  attribute: "password",
                  style: TextStyle(
                      fontSize: SizeConfig.safeBlockVertical * 2.5,
                      color: AppColors.green),
                  obscureText: !review,
                  // controller: _password,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.history,
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
                    labelText: "Retype password",
                    alignLabelWithHint: false,
                    labelStyle: TextStyle(
                        // color: AppTheme.buttonBlend2,
                        fontSize: SizeConfig.safeBlockVertical * 2.5,
                        fontWeight: FontWeight.w500),
                    hintText: "Enter Password",
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              ButtonGreen(
                  height: 40,
                  width: SizeConfig.screenWidth * 0.4,
                  text: "Create Account",
                  press: null),
              SizedBox(
                height: 50,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Already have an account? Sign in!',
                  style: TextStyle(
                      color: AppColors.green,
                      fontSize: SizeConfig.blockSizeVertical * 2,
                      fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

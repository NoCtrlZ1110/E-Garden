import 'package:e_garden/configs/AppConfig.dart';
import 'package:e_garden/core/services/user/user_model.service.dart';
import 'package:e_garden/screens/home.dart';
import 'package:e_garden/widgets/custom_buton_component.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class SignIn extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SignInState();
  }
}

class _SignInState extends State<SignIn> {
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();

  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();
  bool switcherValue = false;
  bool review = false;
  Map<String, dynamic> params;

  @override
  void initState() {
    super.initState();
    // _username = TextEditingController(text: "");
    // _password = TextEditingController(text: "");
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context);
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: FormBuilder(
            key: _fbKey,
            child: Stack(
              children: [
                Image.asset(
                  'assets/images/header.png',
                  width: SizeConfig.screenWidth,
                  fit: BoxFit.fitWidth,
                ),
                Column(
                  children: [
                    SizedBox(height: SizeConfig.blockSizeVertical * 4),
                    Center(
                        child: Image.asset(
                      'assets/images/logoApp.png',
                      height: SizeConfig.blockSizeVertical * 20,
                    )),
                    SizedBox(height: SizeConfig.blockSizeVertical * 2),
                    Text(
                      "E-Garden",
                      style: TextStyle(
                          fontSize: 50,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: SizeConfig.blockSizeVertical * 18),
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
                      height: SizeConfig.safeBlockVertical * 3,
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
                    // SizedBox(
                    //   height: SizeConfig.safeBlockVertical * 5,
                    // ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     Checkbox(
                    //         value: switcherValue,
                    //         onChanged: (change) => setState(() {
                    //               switcherValue = change;
                    //             })),
                    //     SizedBox(
                    //       width: SizeConfig.safeBlockHorizontal * 1,
                    //     ),
                    //     Text(
                    //       "Remember Account",
                    //       style: TextStyle(color: Color(0xFF848484), fontWeight: FontWeight.w600),
                    //     )
                    //   ],
                    // ),
                    SizedBox(
                      height: SizeConfig.safeBlockVertical * 5,
                    ),
                    user.status == Status.Authenticating
                        ? Center(child: CircularProgressIndicator())
                        : CustomButton(
                            child: Text(
                              'SIGN IN',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 23,
                                  fontWeight: FontWeight.w800),
                            ),
                            radius: 18,
                            height: SizeConfig.blockSizeVertical * 5,
                            width: SizeConfig.blockSizeHorizontal * 30,
                            shadowColor: AppColors.btnShadow,
                            backgroundColor: AppColors.buttonColor,
                            onPressed: () async {
                              (_fbKey.currentState.saveAndValidate())
                                  ? (await user
                                          .login(_fbKey.currentState.value))
                                      ? Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  HomeScreen()))
                                      : Fluttertoast.showToast(
                                          msg: user.message,
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Colors.black45,
                                          textColor: Colors.white,
                                          fontSize: 16.0,
                                        )
                                  : Fluttertoast.showToast(
                                      msg: "Invalid Value",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.black45,
                                      textColor: Colors.white,
                                      fontSize: 16.0,
                                    );
                            },
                          ),
                    SizedBox(height: 15),
                    Text(
                      'Not a member yet? Sign up now!',
                      style: TextStyle(
                          color: AppColors.green,
                          fontSize: SizeConfig.blockSizeVertical * 2,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

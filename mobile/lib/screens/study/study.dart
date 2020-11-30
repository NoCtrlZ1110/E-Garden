import 'package:e_garden/configs/AppConfig.dart';
import 'package:e_garden/screens/study/review.dart';
import 'package:e_garden/widgets/custom_app_bar.dart';
import 'package:e_garden/widgets/custom_buton_component.dart';
import 'package:e_garden/widgets/custom_tile.dart';
import 'package:e_garden/widgets/image_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'learn.dart';

class StudyScreen extends StatefulWidget {
  @override
  _StudyScreenState createState() => _StudyScreenState();
}

class _StudyScreenState extends State<StudyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
          height: 120,
          child: SafeArea(
              child: Row(
            children: [
              SizedBox(
                width: 46,
              ),
              Image.asset(
                "assets/images/logo_text.png",
                height: 40,
              ),
              Expanded(
                child: Container(),
              ),
              IconButton(
                icon: Icon(
                  Icons.logout,
                  color: AppColors.green,
                  size: 30,
                ),
                onPressed: () {
                  _showLogoutDialog();
                },
              ),
              SizedBox(
                width: 40,
              ),
            ],
          ))),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ImageSlider(),
              SizedBox(
                height: 10,
              ),
              Divider(
                color: AppColors.green,
                height: 20,
                indent: 100,
                endIndent: 100,
              ),
              SizedBox(
                height: 20,
              ),
              CustomButton(
                  backgroundColor: AppColors.green,
                  child: TileWidget(
                    text: "Learn",
                    color: AppColors.lightBlue,
                    leftText: "15 Units",
                    rightText: "95%",
                  ),
                  height: SizeConfig.safeBlockHorizontal * 40,
                  width: SizeConfig.safeBlockHorizontal * 80,
                  shadowColor: Color(0xFF6CA243),
                  onPressed: () => Navigator.push(
                        context,
                    PageTransition(
                        type: PageTransitionType.rightToLeft,
                        duration: Duration(milliseconds: 400),
                        child: LearnScreen()),                      )),
              SizedBox(
                height: 40,
              ),
              CustomButton(
                  backgroundColor: AppColors.green,
                  child: TileWidget(
                    text: "Review",
                    leftText: "23 Units",
                    rightText: "37%",
                  ),
                  height: SizeConfig.safeBlockHorizontal * 40,
                  width: SizeConfig.safeBlockHorizontal * 80,
                  shadowColor: Color(0xFF6CA243),
                  onPressed: () => Navigator.push(
                        context,
                      PageTransition(
                          type: PageTransitionType.rightToLeft,
                          duration: Duration(milliseconds: 400),
                          child: ReviewScreen()),
                      )),
              SizedBox(
                height: 40,
              ),
              // TileWidget(
              //   color: Colors.orangeAccent,
              //   text: "Exam",
              //   leftText: "51 Units",
              //   rightText: "09%",
              //   press: () {
              //     // Navigator.push(
              //     //   context,
              //     //   MaterialPageRoute(builder: (context) => ExamScreen()),
              //     // );
              //     Fluttertoast.showToast(
              //         msg: "In development!",
              //         toastLength: Toast.LENGTH_SHORT,
              //         timeInSecForIosWeb: 1,
              //         backgroundColor: Colors.red,
              //         textColor: Colors.white,
              //         fontSize: 16.0);
              //   },
              // ),
              // SizedBox(
              //   height: 10,
              // )
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ),
      ),
    );
  }

  Future<void> _showLogoutDialog() async {
    return showDialog<void>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Logout',
            style: TextStyle(
                color: AppColors.green,
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
          content: SingleChildScrollView(
            child: Text(
              'Are you sure?',
              style: TextStyle(fontSize: 20),
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text(
                'Yes',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
            ),
            FlatButton(
              child: Text(
                'No',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}

import 'package:e_garden/configs/AppConfig.dart';
import 'package:e_garden/screens/study/review.dart';
import 'package:e_garden/widgets/custom_app_bar.dart';
import 'package:e_garden/widgets/custom_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'learn.dart';

class StudyScreen extends StatefulWidget {
  @override
  _StudyScreenState createState() => _StudyScreenState();
}

class _StudyScreenState extends State<StudyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  return PopupMenuButton(itemBuilder: (BuildContext context) {
                    return [PopupMenuItem(child: Text("ABC"))];
                  });
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
              TileWidget(
                text: "Learn",
                color: AppColors.lightBlue,
                leftText: "15 Units",
                rightText: "95%",
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LearnScreen()),
                  );
                },
              ),
              SizedBox(
                height: 40,
              ),
              TileWidget(
                text: "Review",
                leftText: "23 Units",
                rightText: "37%",
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ReviewScreen()),
                  );
                },
              ),
              SizedBox(
                height: 40,
              ),
              TileWidget(
                color: Colors.orangeAccent,
                text: "Exam",
                leftText: "51 Units",
                rightText: "09%",
                press: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => ExamScreen()),
                  // );
                  Fluttertoast.showToast(
                      msg: "In development!",
                      toastLength: Toast.LENGTH_SHORT,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0);
                },
              ),
              SizedBox(
                height: 20,
              )
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ),
      ),
    );
  }
}

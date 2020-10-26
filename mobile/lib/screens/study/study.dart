import 'package:e_garden/configs/AppConfig.dart';
import 'package:e_garden/widgets/custom_app_bar.dart';
import 'package:e_garden/widgets/custom_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'file:///C:/Users/NoCtrlZ/Desktop/E-Garden/mobile/lib/screens/study/review.dart';

import 'exam.dart';
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
                width: 20,
              ),
              Image.asset(
                "assets/images/logo.png",
                height: 60,
              ),
              Expanded(
                child: Container(),
              ),
              Icon(
                Icons.library_books_outlined,
                color: AppColors.green,
                size: 40,
              ),
              SizedBox(
                width: 20,
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ExamScreen()),
                  );
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

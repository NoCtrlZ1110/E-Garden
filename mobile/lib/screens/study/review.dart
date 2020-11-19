import 'package:e_garden/configs/AppConfig.dart';
import 'package:e_garden/screens/study/review/grammar.dart';
import 'package:e_garden/screens/study/review/vocabulary.dart';
import 'package:e_garden/widgets/custom_tile.dart';
import 'package:e_garden/widgets/text_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ReviewScreen extends StatefulWidget {
  @override
  _ReviewScreenState createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TextAppBar(
        text: "REVIEW",
        height: 100,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              TileWidget(
                text: "Vocabulary",
                color: AppColors.green,
                leftText: "15 Units",
                rightText: "95%",
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ReviewVocabularyScreen()),
                  );
                },
              ),
              SizedBox(
                height: 40,
              ),
              TileWidget(
                text: "Grammar",
                color: AppColors.green,
                leftText: "23 Units",
                rightText: "37%",
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ReviewGrammarScreen()),
                  );
                },
              ),
              SizedBox(
                height: 40,
              ),
              TileWidget(
                color: AppColors.green,
                text: "Looking back",
                leftText: "51 Units",
                rightText: "09%",
                press: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) {}),
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

import 'package:e_garden/configs/AppConfig.dart';
import 'package:e_garden/widgets/custom_buton_component.dart';
import 'package:e_garden/widgets/custom_tile.dart';
import 'package:e_garden/widgets/text_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'learn/grammar.dart';
import 'learn/listening.dart';
import 'learn/vocabulary.dart';

class LearnScreen extends StatefulWidget {
  @override
  _LearnScreenState createState() => _LearnScreenState();
}

class _LearnScreenState extends State<LearnScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: TextAppBar(
        text: "LEARN",
        height: 100,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomButton(
                  backgroundColor: AppColors.lightBlue,
                  child: TileWidget(
                    text: "Vocabulary",
                    color: AppColors.lightBlue,
                    leftText: "15 Units",
                    rightText: "95%",
                  ),
                  height: SizeConfig.safeBlockHorizontal * 40,
                  width: SizeConfig.safeBlockHorizontal * 80,
                  shadowColor: Color(0xFF0077FF),
                  onPressed: () => Navigator.push(
                        context,
                    PageTransition(
                        type: PageTransitionType.rightToLeft,
                        duration: Duration(milliseconds: 400),
                        child: VocabularyScreen()),
                      )),
              SizedBox(
                height: 40,
              ),
              CustomButton(
                  backgroundColor: AppColors.lightBlue,
                  child: TileWidget(
                    text: "Grammar",
                    color: AppColors.lightBlue,
                    leftText: "23 Units",
                    rightText: "37%",
                  ),
                  height: SizeConfig.safeBlockHorizontal * 40,
                  width: SizeConfig.safeBlockHorizontal * 80,
                  shadowColor: Color(0xFF0077FF),
                  onPressed: () => Navigator.push(
                        context,
                    PageTransition(
                        type: PageTransitionType.rightToLeft,
                        duration: Duration(milliseconds: 400),
                        child: GrammarScreen()),
                      )),
              SizedBox(
                height: 40,
              ),
              CustomButton(
                  backgroundColor: AppColors.lightBlue,
                  child: TileWidget(
                    text: "Listening",
                    leftText: "51 Units",
                    rightText: "09%",
                  ),
                  height: SizeConfig.safeBlockHorizontal * 40,
                  width: SizeConfig.safeBlockHorizontal * 80,
                  shadowColor: Color(0xFF0077FF),
                  onPressed: () => Navigator.push(
                        context,
                    PageTransition(
                        type: PageTransitionType.rightToLeft,
                        duration: Duration(milliseconds: 400),
                        child: ListeningScreen()),
                      )),
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

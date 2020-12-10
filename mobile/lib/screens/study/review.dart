import 'package:e_garden/configs/AppConfig.dart';
import 'package:e_garden/screens/study/learn/learn.provider.dart';
import 'package:e_garden/screens/study/review/select_grammar_topic.dart';
import 'package:e_garden/screens/study/review/select_vocabulary_topic.dart';
import 'package:e_garden/screens/study/study.provider.dart';
import 'package:e_garden/utils/light_color.dart';
import 'package:e_garden/widgets/custom_buton_component.dart';
import 'package:e_garden/widgets/custom_tile.dart';
import 'package:e_garden/widgets/text_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class ReviewScreen extends StatefulWidget {
  @override
  _ReviewScreenState createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<BookModel>(
          builder: (_, model, __) => Scaffold(
                appBar: TextAppBar(
                  text: "REVIEW",
                  height: 100,
                ),
                backgroundColor: Colors.white,
                body: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        CustomButton(
                            backgroundColor: LightColors().buttonLightColor[model.getGrade()],
                            child: TileWidget(
                              text: "Vocabulary",
                              color: LightColors().bookColor[model.getGrade()],
                              leftText: model.listUnit.items.length.toString() + ' Units',
                              rightText: "95%",
                            ),
                            height: SizeConfig.safeBlockHorizontal * 40,
                            width: SizeConfig.safeBlockHorizontal * 80,
                            shadowColor: LightColors().bookColor[model.getGrade()],
                            onPressed: () => Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.rightToLeft,
                                      duration: Duration(milliseconds: 400),
                                      child: SelectVocabularyTopic()),
                                )),
                        SizedBox(
                          height: 40,
                        ),
                        CustomButton(
                            backgroundColor: LightColors().buttonLightColor[model.getGrade()],
                            child: TileWidget(
                              text: "Grammar",
                              color: LightColors().bookColor[model.getGrade()],
                              leftText: "23 Units",
                              rightText: "37%",
                            ),
                            height: SizeConfig.safeBlockHorizontal * 40,
                            width: SizeConfig.safeBlockHorizontal * 80,
                            shadowColor: LightColors().bookColor[model.getGrade()],
                            onPressed: () => Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.rightToLeft,
                                      duration: Duration(milliseconds: 400),
                                      child: SelectGrammarTopic()),
                                )),
                        SizedBox(
                          height: 40,
                        ),
                        CustomButton(
                            backgroundColor: LightColors().buttonLightColor[model.getGrade()],
                            child: TileWidget(
                              text: "Looking back",
                              color: LightColors().bookColor[model.getGrade()],
                              leftText: "15 Units",
                              rightText: "95%",
                            ),
                            height: SizeConfig.safeBlockHorizontal * 40,
                            width: SizeConfig.safeBlockHorizontal * 80,
                            shadowColor: LightColors().bookColor[model.getGrade()],
                            onPressed: () => Fluttertoast.showToast(
                                msg: "In development!",
                                toastLength: Toast.LENGTH_SHORT,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0)),
                        SizedBox(
                          height: 20,
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    ),
                  ),
                ),
              )),
    );
  }
}

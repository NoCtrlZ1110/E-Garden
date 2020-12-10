import 'package:e_garden/configs/AppConfig.dart';
import 'package:e_garden/screens/study/review/select_grammar_topic.dart';
import 'package:e_garden/screens/study/review/select_vocabulary_topic.dart';
import 'package:e_garden/screens/study/study.provider.dart';
import 'package:e_garden/widgets/card.model.dart';
import 'package:e_garden/widgets/text_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class ReviewScreen extends StatefulWidget {
  @override
  _ReviewScreenState createState() => _ReviewScreenState();
  final int bookId;

  ReviewScreen({this.bookId});
}

class _ReviewScreenState extends State<ReviewScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<BookModel>(
          builder: (_, model, __) => Scaffold(
                appBar: TextAppBar(
                  text: "REVIEW",
                  height: SizeConfig.blockSizeVertical * 8,
                  grade: "Grade ${widget.bookId}",
                ),
                backgroundColor: Colors.white,
                body: Stack(
                  children: [
                    Image.asset(
                      'assets/images/background_items.png',
                      width: SizeConfig.screenWidth,
                      height: SizeConfig.screenHeight,
                      fit: BoxFit.cover,
                    ),
                    Center(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            CardModel(
                              width: SizeConfig.blockSizeHorizontal * 85,
                              height: SizeConfig.blockSizeVertical * 25,
                              backgroundColor: Color(0xFFa9dc35),
                              backgroundImagePath: 'assets/images/backgroundBtn.png',
                              labelText: 'Vocabulary',
                              radius: 30,
                              childText: 'English is easy!',
                              radiusBtn: 50,
                              learn: false,
                              onTap: () => Navigator.push(
                                context,
                                PageTransition(
                                    type: PageTransitionType.rightToLeft,
                                    duration: Duration(milliseconds: 400),
                                    child: SelectVocabularyTopic()),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            CardModel(
                              width: SizeConfig.blockSizeHorizontal * 85,
                              height: SizeConfig.blockSizeVertical * 25,
                              backgroundColor: Color(0xFFa9dc35),
                              backgroundImagePath: 'assets/images/backgroundBtn.png',
                              labelText: 'Grammar',
                              radius: 30,
                              childText: 'English is easy!',
                              radiusBtn: 50,
                              learn: false,
                              onTap: () => Navigator.push(
                                context,
                                PageTransition(
                                    type: PageTransitionType.rightToLeft,
                                    duration: Duration(milliseconds: 400),
                                    child: SelectGrammarTopic()),
                              )
                            ),
                            SizedBox(
                              height: 40,
                            ),
                          ],
                          mainAxisAlignment: MainAxisAlignment.center,
                        ),
                      ),
                    ),
                  ],
                ),
              )),
    );
  }
}

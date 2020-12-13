import 'package:e_garden/configs/AppConfig.dart';
import 'package:e_garden/widgets/custom_buton_component.dart';
import 'package:e_garden/widgets/text_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'grammar.dart';

class SelectGrammarTopic extends StatefulWidget {
  @override
  _SelectGrammarTopicState createState() => _SelectGrammarTopicState();
  final int bookId;
  SelectGrammarTopic({this.bookId});
}

class _SelectGrammarTopicState extends State<SelectGrammarTopic> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: TextAppBar(
          text: "Select Topic",
          height: SizeConfig.blockSizeVertical * 8,
          grade: "Grade ${widget.bookId}",
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Container(
                alignment: Alignment.center,
                height: SizeConfig.screenHeight - 150,
                width: SizeConfig.screenWidth,
                child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index) {
                      return Center(
                        child: Column(
                          children: [
                            CustomButton(
                              height: 100,
                              width: SizeConfig.screenWidth * 0.8,
                              onPressed: () => {
                                Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.rightToLeft,
                                      duration: Duration(milliseconds: 400),
                                      child: ReviewGrammarScreen(bookId: widget.bookId,)),
                                )
                              },
                              shadowColor: AppColors.buttonShadow,
                              borderColor: AppColors.green,
                              radius: 10,
                              child: Text(
                                "Topic ${index + 1}",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.darkGreen),
                              ),
                            ),
                            Divider(
                              height: 30,
                              indent: 60,
                              endIndent: 60,
                            )
                          ],
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

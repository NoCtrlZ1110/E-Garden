import 'package:dotted_border/dotted_border.dart';
import 'package:e_garden/configs/AppConfig.dart';
import 'package:e_garden/widgets/button_green.dart';
import 'package:e_garden/widgets/text_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ReviewGrammarScreen extends StatefulWidget {
  @override
  _ReviewGrammarScreenState createState() => _ReviewGrammarScreenState();
  final int bookId;
  ReviewGrammarScreen({this.bookId});
}

class _ReviewGrammarScreenState extends State<ReviewGrammarScreen> {
  final List<String> sentences = <String>[
    'Question 1. This morning when the alarm clock (go) ____ off, I (have) _____ a sweet dream.',
    'Question 2. Carol (meet) ____ her husband while she (travel) ____ in Europe',
    'Question 3. I (walk) ___ on my computer when there (be) ____ a sudden power cut and all my data (be) ____ lost.',
    'Question 4. When (share) ____ a room two years ago, Lin (always, take) ____ my things without asking',
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: TextAppBar(
          text: "GRAMMAR",
          height: SizeConfig.blockSizeVertical,
          grade: 'Grade ${widget.bookId}',
        ),
        floatingActionButton: Container(
          height: 70,
          child: Column(
            children: [
              ButtonGreen(
                width: 120,
                height: 50,
                text: "Next",
                press: () {
                  Fluttertoast.showToast(
                      msg: "In development!",
                      toastLength: Toast.LENGTH_SHORT,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0);
                },
              )
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 40,
                    ),
                    DottedBorder(
                      dashPattern: [4, 1],
                      borderType: BorderType.RRect,
                      color: AppColors.green,
                      strokeWidth: 2,
                      strokeCap: StrokeCap.round,
                      radius: Radius.circular(3),
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Text(
                        "Ex1",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: AppColors.green),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      width: SizeConfig.screenWidth * 0.6,
                      child: Text(
                        "Put the verb in brackets in the past simple or the past continuous.",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 19,
                            color: AppColors.green),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 45,
                ),
                Container(
                  height: SizeConfig.screenHeight * 0.7,
                  child: ListView.builder(
                      itemCount: sentences.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          height: 150,
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            children: [
                              Text(sentences[index],
                                  style: TextStyle(
                                      color: AppColors.green,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600)),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Text("Answer:   ",
                                      style: TextStyle(
                                          color: AppColors.green,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w600)),
                                  Container(
                                    width: SizeConfig.screenWidth * 0.6,
                                    child: TextField(),
                                  )
                                ],
                              ),
                            ],
                          ),
                        );
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

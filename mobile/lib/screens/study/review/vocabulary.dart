import 'dart:math';

import 'package:dotted_border/dotted_border.dart';
import 'package:e_garden/configs/AppConfig.dart';
import 'package:e_garden/widgets/button_green.dart';
import 'package:e_garden/widgets/custom_buton_component.dart';
import 'package:e_garden/widgets/text_app_bar.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ReviewVocabularyScreen extends StatefulWidget {
  @override
  _ReviewVocabularyScreenState createState() => _ReviewVocabularyScreenState();
}

class _ReviewVocabularyScreenState extends State<ReviewVocabularyScreen> {
  String sentence;
  int count = 1;
  int result = 0;
  int max_length = 10;
  final _random = new Random();

  List<String> keys = <String>[];

  final List<String> meaning = <String>[
    'gifted, having a nature ability to do something well',
    'very successful and admired by other people',
    'regarded by society as acceptable, proper and correct',
    'kindness or willingness to give',
    'something that has been obtained by hard word, ability'
  ];

  @override
  void initState() {
    super.initState();
    sentence = meaning[0];
    for (int i = 0; i < 4; i++) {
      keys.add(WordPair.random().asString);
    }
  }

  void refresh() {
    setState(() {
      List<String> temp = <String>[];
      for (int i = 0; i < 4; i++) {
        temp.add(WordPair.random().asString);
      }
      keys = temp;
      sentence = meaning[_random.nextInt(meaning.length)];
      if (count < max_length)
        count++;
      else
        _showDialog();
    });
  }

  void handleAnswer() {
    bool correct = (_random.nextInt(4) == 0);
    if (correct) {
      result++;
    }
    Fluttertoast.showToast(
        msg: correct ? "Correct!" : "Wrong!",
        toastLength: Toast.LENGTH_SHORT,
        timeInSecForIosWeb: 1,
        backgroundColor: correct ? AppColors.green : Colors.red,
        textColor: Colors.white,
        fontSize: 20);
    refresh();
  }

  Future<void> _showDialog() async {
    return showDialog<void>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return WillPopScope(
            onWillPop: () {},
            child: AlertDialog(
              title: Text(
                'Result',
                style: TextStyle(
                    color: AppColors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              content: SingleChildScrollView(
                child: Text(
                  'Correct ${result}/${max_length}',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text(
                    'Share',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    Fluttertoast.showToast(
                        msg: "Development",
                        toastLength: Toast.LENGTH_SHORT,
                        timeInSecForIosWeb: 1,
                        backgroundColor: AppColors.green,
                        textColor: Colors.white,
                        fontSize: 20);
                  },
                ),
                FlatButton(
                  child: Text(
                    'Exit',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                ),
              ],
            ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TextAppBar(
        text: "VOCABULARY",
        height: 100,
      ),
      floatingActionButton: Container(
        height: 70,
        child: Column(
          children: [
            ButtonGreen(
              width: 100,
              height: 50,
              text: count.toString() + '/' + max_length.toString(),
              press: () {},
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
                    color: AppColors.darkGreen,
                    strokeWidth: 2,
                    strokeCap: StrokeCap.round,
                    radius: Radius.circular(3),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Text(
                      "Q",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: AppColors.darkGreen),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    width: SizeConfig.screenWidth * 0.6,
                    child: Text(
                      "Write the words given in the box next to their meaning",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 19,
                          color: AppColors.darkGreen),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                padding: EdgeInsets.all(20),
                height: 150,
                alignment: Alignment.center,
                width: SizeConfig.screenWidth * 0.78,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.1),
                      offset: Offset(2, 2),
                      blurRadius: 10,
                      spreadRadius: 2,
                    )
                  ],
                ),
                child: Text(sentence,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 19,
                        color: AppColors.green)),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                width: SizeConfig.screenWidth * 0.8,
                height: 400,
                child: GridView.count(
                  childAspectRatio: 100 / 85,
                  crossAxisCount: 2,
                  children: List.generate(4, (index) {
                    return Center(
                        child: CustomButton(
                      height: SizeConfig.blockSizeVertical * 15,
                      width: SizeConfig.blockSizeHorizontal * 38,
                      onPressed: () => {handleAnswer()},
                      shadowColor: AppColors.buttonShadow,
                      borderColor: AppColors.green,
                      radius: 10,
                      child: Text(
                        keys.elementAt(index),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppColors.darkGreen),
                      ),
                    ));
                  }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

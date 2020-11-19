import 'package:dotted_border/dotted_border.dart';
import 'package:e_garden/configs/AppConfig.dart';
import 'package:e_garden/widgets/button_green.dart';
import 'package:e_garden/widgets/text_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ReviewVocabularyScreen extends StatefulWidget {
  @override
  _ReviewVocabularyScreenState createState() => _ReviewVocabularyScreenState();
}

class _ReviewVocabularyScreenState extends State<ReviewVocabularyScreen> {
  final List<String> entries = <String>[
    'distinguished',
    'archievement',
    'talented',
    'respectable',
    'generosity'
  ];

  final List<String> meaning = <String>[
    'gifted, having a nature ability to do something well',
    'very successful and admired by other people',
    'regarded by society as acceptable, proper and correct',
    'kindness or willingness to give',
    'something that has been obtained by hard word, ability'
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
                  // OutlineButton(
                  //   child: ,
                  // ),
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
                          color: AppColors.green),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                height: 80,
                width: SizeConfig.screenWidth * 0.8,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.all(8),
                    itemCount: entries.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: EdgeInsets.all(10),
                        child: DottedBorder(
                          dashPattern: [6, 4],
                          borderType: BorderType.RRect,
                          color: AppColors.green,
                          strokeWidth: 1,
                          strokeCap: StrokeCap.round,
                          radius: Radius.circular(30),
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Text(
                            entries[index],
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                color: AppColors.green),
                          ),
                        ),
                      );
                    }),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: SizeConfig.screenHeight * 0.45,
                child: ListView.builder(
                    itemCount: entries.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Row(
                        children: [
                          SizedBox(width: 20),
                          Container(
                            width: SizeConfig.screenWidth * 0.25,
                            child: TextField(),
                            margin: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                          ),
                          Container(
                            width: SizeConfig.screenWidth * 0.55,
                            child: Text(
                              meaning[index],
                              style: TextStyle(
                                  color: AppColors.green,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600),
                            ),
                          )
                        ],
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:e_garden/configs/AppConfig.dart';
import 'package:e_garden/screens/study/study.provider.dart';
import 'package:e_garden/utils/light_color.dart';
import 'package:e_garden/widgets/card.model.dart';
import 'package:e_garden/widgets/courses.model.dart';
import 'package:e_garden/widgets/custom_app_bar.dart';
import 'package:e_garden/widgets/unit_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import 'learn/grammar.dart';
import 'learn/listening.dart';
import 'learn/vocabulary.dart';

class LearnScreen extends StatefulWidget {
  final int bookId;

  _LearnScreenState createState() => _LearnScreenState();

  const LearnScreen(this.bookId);
}

class _LearnScreenState extends State<LearnScreen> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<BookModel>(builder: (_, model, __) {
        return Scaffold(
          key: _drawerKey,
          backgroundColor: AppColors.background,
          endDrawer: Container(
              alignment: Alignment.center,
              width: SizeConfig.blockSizeHorizontal * 45,
              child: Drawer(
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return Divider(
                      height: 2,
                      thickness: 2,
                      endIndent: 20,
                      indent: 20,
                      color: LightColors().bookColor[widget.bookId - 1],
                    );
                  },
                  itemBuilder: (context, index) {
                    return unitModel(index + 1, context, (model.listUnit != null) ? model.listUnit.items[index].id : 1);
                  },
                  itemCount: (model.listUnit != null) ? model.listUnit.items.length : 1,
                ),
              )),
          appBar: CustomAppBar(
            height: SizeConfig.blockSizeVertical * 10,
            color: Colors.transparent,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.green),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'LEARN',
                        style: TextStyle(color: AppColors.green, fontWeight: FontWeight.w700, fontSize: 30),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      child: Container(
                        margin: EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10), border: Border.all(color: AppColors.green)),
                        child: Padding(
                          padding: const EdgeInsets.all(7),
                          child: Icon(
                            Icons.arrow_back_ios_rounded,
                            color: AppColors.green,
                            size: 30,
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    GestureDetector(
                      onTap: () {
                        _drawerKey.currentState.openEndDrawer();
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10), border: Border.all(color: AppColors.green)),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            (model.listUnit != null) ? model.listUnit.items[model.unitIndex - 1].name : 'Unit 1',
                            style: TextStyle(color: AppColors.green, fontWeight: FontWeight.w700, fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          body: Stack(
            children: [
              Image.asset(
                'assets/images/background_items.png',
                width: SizeConfig.screenWidth,
                height: SizeConfig.screenHeight,
                fit: BoxFit.cover,
              ),
              FutureBuilder(
                future: model.fetchListUnit(widget.bookId),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: SizeConfig.blockSizeVertical,
                          ),
                          CardModel(
                            width: SizeConfig.blockSizeHorizontal * 85,
                            height: SizeConfig.blockSizeVertical * 25,
                            backgroundColor: Color(0xFFa9dc35),
                            backgroundImagePath: 'assets/images/backgroundBtn.png',
                            labelText: model.listUnit.items[model.unitIndex - 1].description,
                            radius: 30,
                            childText: 'Learn with flashcards!',
                            radiusBtn: 50,
                            learn: true,
                          ),
                          Container(
                            height: SizeConfig.blockSizeVertical * 60,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  child: Text(
                                    'Courses',
                                    style: TextStyle(fontWeight: FontWeight.w800, fontSize: 25),
                                  ),
                                  alignment: Alignment.centerLeft,
                                  margin: EdgeInsets.only(left: SizeConfig.blockSizeHorizontal * 5),
                                ),
                                CourseModel(
                                  height: SizeConfig.safeBlockHorizontal * 25,
                                  width: SizeConfig.safeBlockHorizontal * 90,
                                  labelText: 'Vocabulary',
                                  childText: "${model.listUnit.items[model.unitIndex - 1].totalWord} Words",
                                  imageChildPath: 'assets/images/animal2.png',
                                  radius: 25,
                                  radiusBtn: 30,
                                  backgroundImageColor: Color(0xFF63d3ff),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.rightToLeft,
                                          duration: Duration(milliseconds: 400),
                                          child: VocabularyScreen(
                                            bookId: widget.bookId,
                                            unitId: model.listUnit.items[model.unitIndex - 1].id,
                                          )),
                                    );
                                  },
                                ),
                                CourseModel(
                                  height: SizeConfig.safeBlockHorizontal * 25,
                                  width: SizeConfig.safeBlockHorizontal * 90,
                                  labelText: 'Grammar',
                                  childText: "${model.listUnit.items[model.unitIndex - 1].totalSentence} Sentences",
                                  radius: 25,
                                  radiusBtn: 30,
                                  imageChildPath: 'assets/images/animal1.png',
                                  backgroundImageColor: Color(0xFF9192ff),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.rightToLeft,
                                          duration: Duration(milliseconds: 400),
                                          child: GrammarScreen(
                                            bookId: widget.bookId,
                                            unitId: model.listUnit.items[model.unitIndex - 1].id,
                                          )),
                                    );
                                  },
                                ),
                                CourseModel(
                                  height: SizeConfig.safeBlockHorizontal * 25,
                                  width: SizeConfig.safeBlockHorizontal * 90,
                                  labelText: 'Listening',
                                  childText: "${model.listUnit.items[model.unitIndex - 1].totalSentence} Sentences",
                                  radius: 25,
                                  radiusBtn: 30,
                                  imageChildPath: 'assets/images/animal4.png',
                                  backgroundImageColor: Color(0xffF9C477),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.rightToLeft,
                                          duration: Duration(milliseconds: 400),
                                          child: ListeningScreen(
                                            bookId: widget.bookId,
                                          )),
                                    );
                                  },
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  }
                  return Center(child: CircularProgressIndicator());
                },
              ),
            ],
          ),
        );
      }),
    );
  }
}

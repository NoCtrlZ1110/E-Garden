import 'package:e_garden/configs/AppConfig.dart';
import 'package:e_garden/screens/study/study.provider.dart';
import 'package:e_garden/utils/light_color.dart';
import 'package:e_garden/widgets/custom_buton_component.dart';
import 'package:e_garden/widgets/custom_tile.dart';
import 'package:e_garden/widgets/unit_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import 'learn/grammar.dart';
import 'learn/listening.dart';
import 'learn/vocabulary.dart';

class LearnScreen extends StatefulWidget {
  @override
  _LearnScreenState createState() => _LearnScreenState();
}

class _LearnScreenState extends State<LearnScreen> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<BookModel>(
          builder: (_, model, __) => Scaffold(
                key: _drawerKey,
                backgroundColor: AppColors.background,
                endDrawer: Container(
                  alignment: Alignment.center,
                  width: SizeConfig.blockSizeHorizontal * 45,
                  child: Drawer(
                    child: ListView.separated(
                      separatorBuilder: (context, index){
                        return Divider(
                          height: 2,
                          thickness: 2,
                          endIndent: 20,
                          indent: 20,
                          color: LightColors().bookColor[model.getGrade()],
                        );
                      },
                      itemBuilder: (context, index) { return unitModel(index + 1, context);},
                      itemCount: 20,
                    ),
                  ),
                ),
                body: Stack(
                  children: [
                    Image.asset(
                      'assets/images/background_items.png',
                      width: SizeConfig.screenWidth,
                      height: SizeConfig.blockSizeVertical * 90,
                      fit: BoxFit.cover,
                    ),
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: SizeConfig.blockSizeVertical * 4,
                          ),
                          Row(
                            children: [
                              SizedBox(width: SizeConfig.blockSizeHorizontal * 3,),
                              GestureDetector(
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: LightColors().bookColor[model.getGrade()]
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Icon(
                                      Icons.arrow_back_ios_rounded,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  Navigator.pop(context);
                                },
                              ),
                              SizedBox(width: SizeConfig.blockSizeHorizontal * 18),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: LightColors().bookColor[model.getGrade()]),
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Row(
                                    children: [
                                      Image.asset('assets/images/logoApp.png',
                                          height: SizeConfig.blockSizeVertical * 4),
                                      SizedBox(width: 15),
                                      Text(
                                        'LEARN',
                                        style:
                                            TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 25),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(width: SizeConfig.blockSizeHorizontal * 7),
                              GestureDetector(
                                onTap: () {
                                  _drawerKey.currentState.openEndDrawer();
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: LightColors().bookColor[model.getGrade()],
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Text(
                                      'Unit ' + model.unit.toString(),
                                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 25),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: SizeConfig.blockSizeVertical * 4,
                          ),
                          Divider(
                            height: 2,
                            thickness: 5,
                            color: LightColors().bookColor[model.getGrade()],
                            indent: SizeConfig.blockSizeHorizontal * 10,
                            endIndent: SizeConfig.blockSizeHorizontal * 10,
                          ),
                          SizedBox(
                            height: SizeConfig.blockSizeVertical * 7,
                          ),
                          Container(
                            height: SizeConfig.blockSizeVertical * 65,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                CustomButton(
                                    backgroundColor: LightColors().buttonLightColor[model.getGrade()],
                                    child: TileWidget(
                                      text: "Vocabulary",
                                      color: LightColors().bookColor[model.getGrade()],
                                      leftText: "15 Units",
                                      rightText: "95%",
                                    ),
                                    height: SizeConfig.safeBlockHorizontal * 30,
                                    width: SizeConfig.safeBlockHorizontal * 70,
                                    shadowColor: LightColors().bookColor[model.getGrade()],
                                    onPressed: () => Navigator.push(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.rightToLeft,
                                          duration: Duration(milliseconds: 400),
                                          child: VocabularyScreen()),
                                    )),
                                CustomButton(
                                    backgroundColor: LightColors().buttonLightColor[model.getGrade()],
                                    child: TileWidget(
                                      text: "Grammar",
                                      color: LightColors().bookColor[model.getGrade()],
                                      leftText: "23 Units",
                                      rightText: "37%",
                                    ),
                                    height: SizeConfig.safeBlockHorizontal * 30,
                                    width: SizeConfig.safeBlockHorizontal * 70,
                                    shadowColor: LightColors().bookColor[model.getGrade()],
                                    onPressed: () => Navigator.push(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.rightToLeft,
                                          duration: Duration(milliseconds: 400),
                                          child: GrammarScreen()),
                                    )),
                                CustomButton(
                                    backgroundColor: LightColors().buttonLightColor[model.getGrade()],
                                    child: TileWidget(
                                      color: LightColors().bookColor[model.getGrade()],
                                      text: "Listening",
                                      leftText: "51 Units",
                                      rightText: "09%",
                                    ),
                                    height: SizeConfig.safeBlockHorizontal * 30,
                                    width: SizeConfig.safeBlockHorizontal * 70,
                                    shadowColor: LightColors().bookColor[model.getGrade()],
                                    onPressed: () => Navigator.push(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.rightToLeft,
                                          duration: Duration(milliseconds: 400),
                                          child: ListeningScreen()),
                                    )),
                              ],
                            ),
                          )
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                      ),
                    ),
                  ],
                ),
              )),
    );
  }
}

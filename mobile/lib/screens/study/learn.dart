import 'package:e_garden/configs/AppConfig.dart';
import 'package:e_garden/screens/study/study.provider.dart';
import 'package:e_garden/utils/light_color.dart';
import 'package:e_garden/widgets/custom_buton_component.dart';
import 'package:e_garden/widgets/custom_tile.dart';
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
                endDrawer: Drawer(
                  child: ListView(
                    children: [
                      ListTile(
                        title: Text('Unit 1'),
                        onTap: () {},
                      ),
                      ListTile(
                        title: Text('Unit 2'),
                        onTap: () {},
                      ),
                      ListTile(
                        title: Text('Unit 3'),
                        onTap: () {},
                      ),
                      ListTile(
                        title: Text('Unit 4'),
                        onTap: () {},
                      ),
                    ],
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
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                                child: Image.asset('assets/images/backmenu.png'),
                                onTap: () {
                                  Navigator.pop(context);
                                },
                              ),
                              Image.asset('assets/images/learn_banner.png'),
                              GestureDetector(
                                child: Image.asset('assets/images/unitlist.png'),
                                onTap: () {
                                  _drawerKey.currentState.openEndDrawer();
                                },
                              ),
                            ],
                          ),
                          SizedBox(
                            height: SizeConfig.blockSizeVertical * 4,
                          ),
                          Divider(
                            height: 2,
                            thickness: 5,
                            color: Color(0xFF468D3E),
                            indent: SizeConfig.blockSizeHorizontal * 10,
                            endIndent: SizeConfig.blockSizeHorizontal * 10,
                          ),
                          SizedBox(
                            height: SizeConfig.blockSizeVertical * 6,
                          ),
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
                          SizedBox(
                            height: 40,
                          ),
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
                          SizedBox(
                            height: 20,
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

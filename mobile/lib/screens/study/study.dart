import 'package:e_garden/configs/AppConfig.dart';
import 'package:e_garden/screens/study/review.dart';
import 'package:e_garden/widgets/custom_app_bar.dart';
import 'package:e_garden/widgets/custom_buton_component.dart';
import 'package:e_garden/widgets/custom_tile.dart';
import 'package:e_garden/widgets/image_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'learn.dart';

class StudyScreen extends StatefulWidget {
  @override
  _StudyScreenState createState() => _StudyScreenState();
}

class _StudyScreenState extends State<StudyScreen> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _drawerKey,
        backgroundColor: Colors.white,
        appBar: CustomAppBar(
          child: Row(
            children: [
              IconButton(
                icon: Icon(Icons.menu, color: Colors.green, size: SizeConfig.blockSizeVertical*4,),
                onPressed: () {
                  _drawerKey.currentState.openDrawer();
                },
              ),
              SizedBox(width: 20,),
              Image.asset(
                "assets/images/logo_text.png",
                height: SizeConfig.blockSizeVertical*5,
              ),
            ],
          ),
        ),
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              Container(
                child: Column(
                  children: [
                    SizedBox(height: 15),
                    Container(
                      height: SizeConfig.blockSizeVertical * 20,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.amberAccent,
                            width: 10,
                          )),
                      alignment: Alignment.center,
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white,
                            )),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(180),
                            child: Image.asset(
                              'assets/images/avt.jpg',
                              fit: BoxFit.fill,
                            )),
                      ),
                    ),
                    SizedBox(height: 15),
                    Center(
                      child: Column(
                        children: [
                          Text(
                            'Nguyễn Thị Xuân',
                            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600, color: Colors.black45),
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    'Từ đã học',
                                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black45),
                                  ),
                                  Text(
                                    20.toString(),
                                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black45),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    'Từ đã ôn tập',
                                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black45),
                                  ),
                                  Text(
                                    20.toString(),
                                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black45),
                                  )
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 18,)
                        ],
                      ),
                    ),
                  ],
                ),
                color: Colors.greenAccent,
              ),
              Container(
                  height: SizeConfig.blockSizeVertical * 8,
                  child: RaisedButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        Icon(Icons.edit_outlined, color: Colors.green),
                        SizedBox(
                          width: SizeConfig.blockSizeHorizontal * 5,
                        ),
                        Text(
                          'Edit Profile',
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                    splashColor: Colors.green,
                    elevation: 0,
                  )),
              Container(
                  height: SizeConfig.blockSizeVertical * 8,
                  child: RaisedButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        Icon(Icons.menu_book, color: Colors.green),
                        SizedBox(
                          width: SizeConfig.blockSizeHorizontal * 5,
                        ),
                        Text(
                          'Achievements',
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                    splashColor: Colors.greenAccent,
                    elevation: 0,
                  )),
              Container(
                  height: SizeConfig.blockSizeVertical * 8,
                  child: RaisedButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        Icon(Icons.flag_outlined, color: Colors.green),
                        SizedBox(
                          width: SizeConfig.blockSizeHorizontal * 5,
                        ),
                        Text(
                          'Report',
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                    splashColor: Colors.greenAccent,
                    elevation: 0,
                  )),
              Container(
                  height: SizeConfig.blockSizeVertical * 8,

                  child: RaisedButton(
                    onPressed: () {
                      _showLogoutDialog();
                    },
                    child: Row(
                      children: [
                        Icon(Icons.logout, color: Colors.green),
                        SizedBox(
                          width: SizeConfig.blockSizeHorizontal * 5,
                        ),
                        Text(
                          'Logout',
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                    splashColor: Colors.greenAccent,
                    elevation: 0,
                  )),
              Expanded(child: SizedBox()),
              Image.asset(
                "assets/images/logo_text.png",
                height: SizeConfig.blockSizeVertical*5,
              ),
              Expanded(child: SizedBox())
            ],
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ImageSlider(),
                SizedBox(
                  height: SizeConfig.blockSizeVertical * 5,
                ),
                CustomButton(
                    backgroundColor: AppColors.green,
                    child: TileWidget(
                      text: "Learn",
                      color: AppColors.lightBlue,
                      leftText: "15 Units",
                      rightText: "95%",
                    ),
                    height: SizeConfig.safeBlockHorizontal * 30,
                    width: SizeConfig.safeBlockHorizontal * 75,
                    shadowColor: Color(0xFF6CA243),
                    onPressed: () => Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.rightToLeft,
                              duration: Duration(milliseconds: 400),
                              child: LearnScreen()),
                        )),
                SizedBox(
                  height: SizeConfig.blockSizeVertical * 5,
                ),
                CustomButton(
                    backgroundColor: AppColors.green,
                    child: TileWidget(
                      text: "Review",
                      leftText: "23 Units",
                      rightText: "37%",
                    ),
                    height: SizeConfig.safeBlockHorizontal * 30,
                    width: SizeConfig.safeBlockHorizontal * 75,
                    shadowColor: Color(0xFF6CA243),
                    onPressed: () => Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.rightToLeft,
                              duration: Duration(milliseconds: 400),
                              child: ReviewScreen()),
                        )),
                SizedBox(
                  height: SizeConfig.blockSizeVertical * 5,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _showLogoutDialog() async {
    return showDialog<void>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Logout',
            style: TextStyle(color: AppColors.green, fontWeight: FontWeight.bold, fontSize: 20),
          ),
          content: SingleChildScrollView(
            child: Text(
              'Are you sure?',
              style: TextStyle(fontSize: 20),
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text(
                'Yes',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                int count = 0;
                Navigator.of(context).popUntil((_) => count++ >= 3);
              },
            ),
            FlatButton(
              child: Text(
                'No',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}

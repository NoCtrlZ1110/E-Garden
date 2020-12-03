import 'package:dotted_border/dotted_border.dart';
import 'package:e_garden/configs/AppConfig.dart';
import 'package:e_garden/screens/dictionary/home_dictionary.dart';
import 'package:e_garden/screens/notes/notes.dart';
import 'package:e_garden/screens/notes/test.dart';
import 'package:e_garden/screens/study/study.dart';
import 'package:e_garden/widgets/custom_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  static List<Widget> _widgetOptions = <Widget>[StudyScreen(), HomeDictionaryScreen(), CalendarPage()];
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          body: Column(
            children: [
              Expanded(
                child: TabBarView(
                  controller: _controller,
                  physics: BouncingScrollPhysics(),
                  children: [
                    StudyScreen(),
                    HomeDictionaryScreen(),
                    // CalendarPage()
                    Test()
                  ],
                ),
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
                                  DottedBorder(
                                      padding: EdgeInsets.all(15),
                                      dashPattern: [6, 6],
                                      borderType: BorderType.Oval,
                                      color: Colors.white,
                                      strokeWidth: 2,
                                      strokeCap: StrokeCap.round,
                                      radius: Radius.circular(20),
                                      child: Column(
                                        children: [
                                          Text(
                                            'Learn',
                                            style:
                                            TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black45),
                                          ),
                                          Text(
                                            20.toString(),
                                            style:
                                            TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black45),
                                          )
                                        ],
                                      )),
                                  DottedBorder(
                                    padding: EdgeInsets.all(15),
                                    dashPattern: [6, 6],
                                    borderType: BorderType.Circle,
                                    color: Colors.white,
                                    strokeWidth: 2,
                                    strokeCap: StrokeCap.round,
                                    radius: Radius.circular(20),
                                    child: Column(
                                      children: [
                                        Text(
                                          'Review',
                                          style:
                                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black45),
                                        ),
                                        Text(
                                          20.toString(),
                                          style:
                                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black45),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 18,
                              )
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
                    height: SizeConfig.blockSizeVertical * 5,
                  ),
                  Expanded(child: SizedBox())
                ],
              ),
            ),
            body: Column(
              children: [
                Expanded(
                  child: TabBarView(
                    controller: _controller,
                    physics: BouncingScrollPhysics(),
                    children: [StudyScreen(), HomeDictionaryScreen(), CalendarPage()],
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(color: const Color(0xFFF1F1F1), boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 2.0,
                    ),
                  ]),
                  child: DefaultTabController(
                    length: _widgetOptions.length,
                    child: TabBar(
                      indicatorWeight: 2,
                      indicatorColor: Colors.green,
                      unselectedLabelColor: Colors.grey,
                      labelColor: Colors.green,
                      indicatorSize: TabBarIndicatorSize.tab,
                      tabs: [
                        Tab(
                          icon: Icon(Icons.home),
                        ),
                        Tab(
                          icon: Icon(Icons.search),
                        ),
                        Tab(
                          icon: Icon(Icons.event_note),
                        ),
                      ],
                      controller: _controller,
                    ),
                  ),
                ),
              ],
            ),
          )),
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

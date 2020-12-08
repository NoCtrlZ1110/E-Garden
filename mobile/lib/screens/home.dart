import 'package:dotted_border/dotted_border.dart';
import 'package:e_garden/configs/AppConfig.dart';
import 'package:e_garden/screens/dictionary/home_dictionary.dart';
import 'package:e_garden/screens/home.provider.dart';
import 'package:e_garden/screens/notes/notes.dart';
import 'package:e_garden/screens/study/study.dart';
import 'package:e_garden/screens/user.profile/edit.user.profile.dart';
import 'package:e_garden/widgets/custom_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  TabController _controller;
  PageController _pageController = PageController(initialPage: 0);

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
    _pageController.dispose();
  }

  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    List<Widget> _widgetOptions = <Widget>[StudyScreen(), HomeDictionaryScreen(), CalendarPage()];
    return SafeArea(
      child: WillPopScope(
          onWillPop: () async => false,
          child: Consumer<HomeModel>(builder: (_, homeModel, __) => Scaffold(
            bottomNavigationBar: ConvexAppBar(
                items: [
                  TabItem(icon: Icons.home),
                  TabItem(icon: Icons.search),
                  TabItem(icon: Icons.event_note_outlined)
                ],
                controller: _controller,
                color: Colors.white,
                backgroundColor: Colors.green[400],
                onTap: (int index) {
                  homeModel.changeItem(index);
                  _pageController.animateToPage(
                      homeModel.selectedItem , duration: Duration(milliseconds: 1000), curve: Curves.ease
                  );
                  //Navigator.push(context, MaterialPageRoute(builder: (context) => _widgetOptions[i]));
                }
            ),
            key: _drawerKey,
            backgroundColor: AppColors.background,
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
                                            style: TextStyle(
                                                fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black45),
                                          ),
                                          Text(
                                            20.toString(),
                                            style: TextStyle(
                                                fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black45),
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
                                          style: TextStyle(
                                              fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black45),
                                        ),
                                        Text(
                                          20.toString(),
                                          style: TextStyle(
                                              fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black45),
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
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfile()));
                        },
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
                              'Feedback',
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
            appBar: CustomAppBar(
              height: SizeConfig.blockSizeVertical * 10,
              child: Row(
                children: [
                  IconButton(
                      icon: Icon(
                        Icons.menu,
                        color: Colors.green,
                        size: SizeConfig.blockSizeVertical * 4,
                      ),
                      onPressed: () {
                        _drawerKey.currentState.openDrawer();
                      }),
                  SizedBox(
                    width: 20,
                  ),
                  Image.asset(
                    "assets/images/logo_text.png",
                    height: SizeConfig.blockSizeVertical * 5,
                  ),
                ],
              ),
            ),
            body: Column(
              children: [
                Container(
                  height: SizeConfig.blockSizeVertical * 77,
                  child: Stack(
                    children: [
                      Image.asset(
                        'assets/images/background_items.png',
                        height: SizeConfig.blockSizeVertical * 90,
                        fit: BoxFit.fitHeight,
                      ),
                      PageView(
                        children: _widgetOptions,
                        controller: _pageController,
                        onPageChanged: (index) {
                          homeModel.changeItem(index);
                          _controller.animateTo(homeModel.selectedItem, duration: Duration(milliseconds: 1000));
                        },
                      )
                    ],
                  ),
                ),
              ],
            ),
          ))));
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

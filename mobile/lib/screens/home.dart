import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:e_garden/application.dart';
import 'package:e_garden/configs/AppConfig.dart';
import 'package:e_garden/screens/dictionary/home_dictionary.dart';
import 'package:e_garden/screens/home.provider.dart';
import 'package:e_garden/screens/notes/notes.dart';
import 'package:e_garden/screens/study/study.dart';
import 'package:e_garden/screens/user.profile/edit.user.profile.dart';
import 'package:e_garden/widgets/custom_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  TabController _controller;
  PageController _pageController = PageController();
  bool isSwipe = false;

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
            child: Consumer<HomeModel>(
                builder: (_, homeModel, __) => Scaffold(
                      bottomNavigationBar: ConvexAppBar(
                          height: SizeConfig.blockSizeVertical * 7,
                          items: [
                            TabItem(icon: Icons.home),
                            TabItem(icon: Icons.search),
                            TabItem(icon: Icons.event_note_outlined)
                          ],
                          controller: _controller,
                          color: Colors.white,
                          backgroundColor: Colors.green[400],
                          onTap: (int index) {
                            _pageController.animateToPage(index,
                                duration: Duration(milliseconds: 1000), curve: Curves.ease);
                          }),
                      key: _drawerKey,
                      backgroundColor: AppColors.background,
                      drawer: Drawer(
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: SizeConfig.blockSizeVertical * 45,
                              color: Colors.green[200],
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    height: SizeConfig.blockSizeVertical * 20,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: AppColors.green,
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
                                  Text(
                                    'Nguyễn Thị Xuân',
                                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600, color: Colors.black45),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      DottedBorder(
                                          padding: EdgeInsets.all(15),
                                          dashPattern: [6, 6],
                                          borderType: BorderType.RRect,
                                          color: AppColors.green,
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
                                        borderType: BorderType.RRect,
                                        color: AppColors.green,
                                        strokeWidth: 2,
                                        // strokeCap: StrokeCap.round,
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
                                    height: SizeConfig.blockSizeVertical,
                                  )
                                ],
                              ),
                            ),
                            Container(
                              height: SizeConfig.blockSizeVertical * 32,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
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
                                            width: SizeConfig.blockSizeHorizontal * 8,
                                          ),
                                          Text(
                                            'Edit Profile',
                                            style: TextStyle(fontSize: 20),
                                          ),
                                          Expanded(child: SizedBox()),
                                          Icon(Icons.navigate_next_outlined, color: Colors.green, size: 30,),
                                          SizedBox(width: 5,)
                                        ],
                                      ),
                                      splashColor: Colors.green,
                                      elevation: 0,
                                      color: Colors.transparent,
                                    ),
                                  ),
                                  Container(
                                    height: SizeConfig.blockSizeVertical * 8,
                                    child: RaisedButton(
                                      onPressed: () {},
                                      child: Row(
                                        children: [
                                          Icon(Icons.menu_book, color: Colors.green),
                                          SizedBox(
                                            width: SizeConfig.blockSizeHorizontal * 8,
                                          ),
                                          Text(
                                            'Achievements',
                                            style: TextStyle(fontSize: 20),
                                          ),
                                          Expanded(child: SizedBox()),
                                          Icon(Icons.navigate_next_outlined, color: Colors.green, size: 30,),
                                          SizedBox(width: 5,)
                                        ],
                                      ),
                                      splashColor: Colors.greenAccent,
                                      elevation: 0,
                                      color: Colors.transparent,
                                    ),
                                  ),
                                  Container(
                                    height: SizeConfig.blockSizeVertical * 8,
                                    child: RaisedButton(
                                      onPressed: () {},
                                      child: Row(
                                        children: [
                                          Icon(Icons.flag_outlined, color: Colors.green),
                                          SizedBox(
                                            width: SizeConfig.blockSizeHorizontal * 8,
                                          ),
                                          Text(
                                            'Feedback',
                                            style: TextStyle(fontSize: 20),
                                          ),
                                          Expanded(child: SizedBox()),
                                          Icon(Icons.navigate_next_outlined, color: Colors.green, size: 30,),
                                          SizedBox(width: 5,)
                                        ],
                                      ),
                                      splashColor: Colors.greenAccent,
                                      color: Colors.transparent,
                                      elevation: 0,
                                    ),
                                  ),
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
                                            width: SizeConfig.blockSizeHorizontal * 8,
                                          ),
                                          Text(
                                            'Logout',
                                            style: TextStyle(fontSize: 20),
                                          ),
                                          Expanded(child: SizedBox()),
                                          Icon(Icons.navigate_next_outlined, color: Colors.green, size: 30,),
                                          SizedBox(width: 5,)
                                        ],
                                      ),
                                      splashColor: Colors.greenAccent,
                                      color: Colors.transparent,
                                      elevation: 0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(child: SizedBox()),
                            Image.asset(
                              "assets/images/logo_text.png",
                              height: SizeConfig.blockSizeVertical * 8,
                            ),
                            Expanded(child: SizedBox()),
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
                            height: SizeConfig.blockSizeVertical * 75,
                            child: Stack(
                              children: [
                                Opacity(
                                    opacity: 0.4,
                                    child: Image.asset(
                                      'assets/images/background_items.png',
                                      height: SizeConfig.blockSizeVertical * 90,
                                      fit: BoxFit.fitHeight,
                                    )),
                                PageView(
                                  children: _widgetOptions,
                                  physics: NeverScrollableScrollPhysics(),
                                  controller: _pageController,
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
                Application.sharePreference.clear();
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

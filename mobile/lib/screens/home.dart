import 'package:e_garden/configs/AppConfig.dart';
import 'package:e_garden/screens/dictionary/home_dictionary.dart';
import 'package:e_garden/screens/notes/notes.dart';
import 'package:e_garden/screens/study/study.dart';
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
        ));
  }
}

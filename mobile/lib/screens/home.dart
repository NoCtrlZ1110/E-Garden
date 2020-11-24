import 'package:e_garden/screens/dictionary/home_dictionary.dart';
import 'package:e_garden/screens/notes/notes.dart';
import 'package:e_garden/screens/study/study.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static List<Widget> _widgetOptions = <Widget>[
    StudyScreen(),
    HomeDictionaryScreen(),
    CalendarPage()
  ];

  @override
  Widget build(BuildContext context) {

    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
            body: _widgetOptions.elementAt(_selectedIndex),
            bottomNavigationBar: BottomNavigationBar(
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "Study"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.search), label: "Dictionary"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.event_note), label: "Notes")
              ],
              currentIndex: _selectedIndex,
              selectedItemColor: Colors.amber[800],
              onTap: _onItemTapped,
            )));
  }
}

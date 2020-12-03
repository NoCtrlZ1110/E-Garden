import 'package:e_garden/configs/AppConfig.dart';
import 'package:e_garden/screens/notes/component/task_container.dart';
import 'package:e_garden/widgets/custom_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  CalendarController _calendarController = CalendarController();
  List<String> _list = ["a", "a"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  CustomAppBar(
          height: 120,
          child: SafeArea(
              child: Row(
                children: [
                  SizedBox(
                    width: 46,
                  ),
                  Image.asset(
                    "assets/images/logo_text.png",
                    height: 40,
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.logout,
                      color: AppColors.green,
                      size: 30,
                    ),
                    onPressed: () {
                      return PopupMenuButton(itemBuilder: (BuildContext context) {
                        return [PopupMenuItem(child: Text("ABC"))];
                      });
                    },
                  ),
                  SizedBox(
                    width: 40,
                  ),
                ],
              ))),
      body: Stack(
        children: [
          Container(
            width: SizeConfig.screenWidth,
            height: SizeConfig.screenHeight,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/images/login/bg_screen.png"), fit: BoxFit.fill),
              borderRadius: BorderRadius.only(topLeft: const Radius.circular(20.0), topRight: const Radius.circular(20.0)),
            ),
          ),
          Column(
            children: [
              _buildTableCalendar(),
              // Expanded(
              //   child: Consumer<DailyCalendarCubit, DateTime>(
              //     cubit: _cubit,
              //     builder: (context, time) {
              //       return ScrollCalendar(queryDate: time, onBookAppointment: false);
              //     },
              //   ),
              // )
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTableCalendar() {
    return TableCalendar(
      calendarController: _calendarController,
      startingDayOfWeek: StartingDayOfWeek.monday,
      initialSelectedDay: DateTime.now(),
      initialCalendarFormat: CalendarFormat.week,
      calendarStyle: CalendarStyle(
        selectedColor: Colors.redAccent,
        todayColor: Colors.green,
        markersColor: Colors.green,
        outsideDaysVisible: false,
      ),
      headerStyle: HeaderStyle(
        formatButtonTextStyle:
            TextStyle().copyWith(color: Colors.white, fontSize: 15.0),
        formatButtonDecoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
      onDaySelected: (day, events, holidays) {},
    );
  }
}

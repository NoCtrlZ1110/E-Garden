import 'package:e_garden/configs/AppConfig.dart';
import 'package:e_garden/core/services/note/note_model.service.dart';
import 'package:e_garden/screens/notes/component/task_container.dart';
import 'package:e_garden/widgets/custom_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:e_garden/utils/light_color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  CalendarController _calendarController = CalendarController();
  Map<String, dynamic> params = {"UserId": 1};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: SizeConfig.screenWidth,
            height: SizeConfig.screenHeight,
            decoration: BoxDecoration(
             // image: DecorationImage(image: AssetImage("assets/images/login/bg_screen.png"), fit: BoxFit.fill),
              borderRadius:
                  BorderRadius.only(topLeft: const Radius.circular(20.0), topRight: const Radius.circular(20.0)),
            ),
          ),
          Column(
            children: [
              _buildTableCalendar(),
              Expanded(
                child: Consumer<NoteModel>(
                  builder: (_, notes, __) {
                    return FutureBuilder(
                        future: notes.fetchListNote(params),
                        builder: (context, snapshot) {
                          return (snapshot.hasData) ? Container(child: Text("Load"),) : Center(child: CircularProgressIndicator());
                        });
                  },
                ),
              )
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
        formatButtonTextStyle: TextStyle().copyWith(color: Colors.white, fontSize: 15.0),
        formatButtonDecoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
      onDaySelected: (day, events, holidays) {},
    );
  }
}

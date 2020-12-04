import 'package:e_garden/configs/AppConfig.dart';
import 'package:e_garden/core/models/notes/notes.dart';
import 'package:e_garden/core/services/note/note_model.service.dart';
import 'package:e_garden/screens/notes/component/task_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:getwidget/getwidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
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
              borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(20.0),
                  topRight: const Radius.circular(20.0)),
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
                          return (snapshot.hasData)
                              // ? _buildListNote(notes.listNote)
                              ? _buildList(notes.listNote)
                              //? note()
                              : Center(child: CircularProgressIndicator());
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


  Widget _buildList(Notes notes) {
    return StaggeredGridView.countBuilder(
      crossAxisCount: 2,
      itemCount: notes.items.length,
      itemBuilder: (BuildContext context, int index) => Center(
        child: TaskContainer(
            isDone: notes.items.elementAt(index).status,
            title: notes.items.elementAt(index).titleNote,
            subtitle: notes.items.elementAt(index).detailNote,
            num: index),
      ),
      staggeredTileBuilder: (int index) => StaggeredTile.fit(1),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
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

import 'package:e_garden/configs/AppConfig.dart';
import 'package:e_garden/core/models/notes/notes.dart';
import 'package:e_garden/core/services/note/note_model.service.dart';
import 'package:e_garden/screens/notes/component/task_container.dart';
import 'package:e_garden/screens/notes/create_new_note.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:e_garden/application.dart';

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  CalendarController _calendarController = CalendarController();
  Map<String, dynamic> params;

  @override
  void initState() {
    // TODO: implement initState
    params = {
      "UserId": Application.sharePreference.getInt('userId'),
      "Date": DateTime.now()
    };
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NoteModel>(builder: (_, notes, __) {
      return Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(children: [
          _buildTableCalendar(notes),
          Expanded(
            child: FutureBuilder(
                future: notes.fetchListNote(notes.params ?? params),
                builder: (context, snapshot) {
                  if (snapshot.connectionState != ConnectionState.done) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasData) {
                    return _buildList(notes.listNote);
                  }
                  return Center(child: CircularProgressIndicator());
                }),
          )
        ]),
        floatingActionButton: FutureBuilder(
            future: notes.fetchListNote(notes.params ?? params),
            builder: (context, snapshot) => (snapshot.hasData)
                ? (notes.listNote.items.length != 0)
                    ? FloatingActionButton(
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CreateNewTaskPage(0))),
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 29,
                        ),
                        backgroundColor: AppColors.green,
                        tooltip: 'Add Note',
                        elevation: 5,
                        splashColor: Colors.grey,
                      )
                    : SizedBox()
                : SizedBox()),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      );
    });
  }

  Widget _buildList(Notes notes) {
    return (notes.items.length != 0)
        ? StaggeredGridView.countBuilder(
            crossAxisCount: 2,
            itemCount: notes.items.length,
            itemBuilder: (BuildContext context, int index) => Center(
              child: TaskContainer(
                  isDone: notes.items.elementAt(index).status,
                  title: notes.items.elementAt(index).titleNote,
                  subtitle: notes.items.elementAt(index).detailNote,
                  num: index,
                  noteId: notes.items.elementAt(index).id),
            ),
            staggeredTileBuilder: (int index) => StaggeredTile.fit(1),
            mainAxisSpacing: 4.0,
            crossAxisSpacing: 4.0,
          )
        : Center(
            child: InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CreateNewTaskPage(0))),
              child: Icon(
                Icons.note_add,
                size: 200,
                color: Colors.grey[300],
              ),
            ),
          );
  }

  Widget _buildTableCalendar(NoteModel notes) {
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
      onDaySelected: (day, events, holidays) async {
        notes.params = {
          "UserId": Application.sharePreference.getInt('userId'),
          "Date": DateTime(day.year, day.month, day.day).toString()
        };
        // await notes.fetchListNote(params);
      },
    );
  }
}

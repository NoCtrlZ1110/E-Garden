import 'package:e_garden/configs/AppConfig.dart';
import 'package:e_garden/core/services/note/note_model.service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:provider/provider.dart';

class TaskContainer extends StatelessWidget {
  final bool isDone;
  final String title;
  final String subtitle;
  final int num;
  final List<Color> ListColor = [
    Colors.yellow,
    Colors.lightBlueAccent,
    Colors.cyanAccent[100]
  ];

  TaskContainer({this.isDone, this.title, this.subtitle, this.num});

  @override
  Widget build(BuildContext context) {
    print(num);
    return Consumer<NoteModel>(
      builder: (_, noteModel, __) => GestureDetector(
        onTap: () {},
        child: Container(
          alignment: Alignment.center,
          width: SizeConfig.blockSizeHorizontal * 50,
          margin: EdgeInsets.all(12.0),
          child: GFCard(
              borderOnForeground: true,
              elevation: 0,
              padding: EdgeInsets.all(0),
              color: isDone ? ListColor[num ?? 0 % 3] : Colors.grey[300],
              title: GFListTile(
                padding: EdgeInsets.all(0),
                margin: EdgeInsets.all(0),
                title: Text(
                  title,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                icon: (isDone)
                    ? ClipOval(
                        child: Material(
                          color: Colors.white, // button color
                          child: InkWell(
                            splashColor: Colors.red, // inkwell color
                            child: Icon(Icons.done),
                          ),
                        ),
                      )
                    : ClipOval(
                        child: Material(
                          color: Colors.transparent, // button color
                        ),
                      ),
              ),
              content: Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      border: Border(
                          top: BorderSide(
                    color: Colors.black,
                    width: 1.0,
                  ))),
                  child: Text(subtitle))),
          decoration: BoxDecoration(
            color: isDone ? ListColor[this.num ?? 0 % 3] : Colors.grey[300],
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:e_garden/configs/AppConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextAppBar extends StatefulWidget implements PreferredSizeWidget {
  String text;
  double height;
  Color color;

  TextAppBar({
    @required this.text,
    this.height = kToolbarHeight,
    this.color,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  _TextAppBarState createState() => _TextAppBarState();
}

class _TextAppBarState extends State<TextAppBar> {
  var dropdownValue = "Unit 1";
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.preferredSize.height,
      color: widget.color != null ? widget.color : Colors.white,
      alignment: Alignment.center,
      child: SafeArea(
          child: Row(
        children: [
          SizedBox(
            width: SizeConfig.screenWidth * 0.075,
          ),
          GestureDetector(
            child: Text(
              "BACK",
              style: TextStyle(
                  color: AppColors.green,
                  fontWeight: FontWeight.w700,
                  fontSize: 18),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          Expanded(
            child: Container(),
          ),
          RaisedButton(
              onPressed: () {},
              child: Text(
                widget.text,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
              color: AppColors.green,
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              )),
          Expanded(
            child: Container(),
          ),
          // GestureDetector(
          //   child: Text(
          //     "UNIT 1",
          //     style: TextStyle(
          //         color: AppColors.green,
          //         fontWeight: FontWeight.w700,
          //         fontSize: 18),
          //   ),
          //   onTap: () {},
          // ),
          DropdownButton<String>(
            value: dropdownValue,
            icon: Icon(
              Icons.arrow_downward,
              size: 16,
              color: AppColors.green,
            ),
            iconSize: 24,
            elevation: 16,
            style: TextStyle(
                color: AppColors.green,
                fontWeight: FontWeight.w700,
                fontSize: 18),
            // underline: Container(
            //   height: 2,
            //   color: Colors.deepPurpleAccent,
            // ),
            onChanged: (String newValue) {
              setState(() {
                dropdownValue = newValue;
              });
            },
            items: <String>[
              'Unit 1',
              'Unit 2',
              'Unit 3',
              'Unit 4',
              'Unit 5',
              'Unit 6',
              'Unit 7',
              'Unit 8',
              'Unit 9',
              'Unit 10'
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          SizedBox(
            width: SizeConfig.screenWidth * 0.075,
          )
        ],
      )),
    );
  }
}

//
// class TextAppBar extends StatefulWidget{
//   final String text;
//   final double height;
//   final Color color;
//
//   TextAppBar({
//     @required this.text,
//     this.height = kToolbarHeight,
//     this.color,
//   });
//
//   @override
//   Size get preferredSize => Size.fromHeight(height);
//
//   @override
//   Widget build(BuildContext context) {
//     String dropdownValue = "Unit 1";
//     return Container(
//       height: preferredSize.height,
//       color: color != null ? color : Colors.white,
//       alignment: Alignment.center,
//       child: SafeArea(
//           child: Row(
//         children: [
//           SizedBox(
//             width: SizeConfig.screenWidth * 0.075,
//           ),
//           GestureDetector(
//             child: Text(
//               "BACK",
//               style: TextStyle(
//                   color: AppColors.green,
//                   fontWeight: FontWeight.w700,
//                   fontSize: 18),
//             ),
//             onTap: () {
//               Navigator.pop(context);
//             },
//           ),
//           Expanded(
//             child: Container(),
//           ),
//           RaisedButton(
//               onPressed: () {},
//               child: Text(
//                 text,
//                 style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
//               ),
//               color: AppColors.green,
//               textColor: Colors.white,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(8),
//               )),
//           Expanded(
//             child: Container(),
//           ),
//           GestureDetector(
//             child: Text(
//               "UNIT 1",
//               style: TextStyle(
//                   color: AppColors.green,
//                   fontWeight: FontWeight.w700,
//                   fontSize: 18),
//             ),
//             onTap: () {},
//           ),
//           DropdownButton(
//               items: <String>[
//                 'Unit 1',
//                 'Unit 2',
//                 'Unit 3',
//                 'Unit 4',
//                 'Unit 5',
//                 'Unit 6',
//                 'Unit 7',
//                 'Unit 8',
//                 'Unit 9',
//                 'Unit 10'
//               ].map<DropdownMenuItem<String>>((String value) {
//                 return DropdownMenuItem<String>(
//                   value: value,
//                   child: Text(value),
//                 );
//               }).toList(),
//               onChanged: null),
//           DropdownButton<String>(
//             value: dropdownValue,
//             icon: Icon(Icons.arrow_downward),
//             iconSize: 24,
//             elevation: 16,
//             style: TextStyle(color: Colors.deepPurple),
//             underline: Container(
//               height: 2,
//               color: Colors.deepPurpleAccent,
//             ),
//             onChanged: (String newValue) {
//               // setState(() {
//               //   dropdownValue = newValue;
//               // });
//             },
//             items: <String>[
//               'Unit 1',
//               'Unit 2',
//               'Unit 3',
//               'Unit 4',
//               'Unit 5',
//               'Unit 6',
//               'Unit 7',
//               'Unit 8',
//               'Unit 9',
//               'Unit 10'
//             ].map<DropdownMenuItem<String>>((String value) {
//               return DropdownMenuItem<String>(
//                 value: value,
//                 child: Text(value),
//               );
//             }).toList(),
//           ),
//           SizedBox(
//             width: SizeConfig.screenWidth * 0.075,
//           )
//         ],
//       )),
//     );
//   }
// }

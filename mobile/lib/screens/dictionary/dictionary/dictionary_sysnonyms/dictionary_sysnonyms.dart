import 'package:dotted_border/dotted_border.dart';
import 'package:e_garden/configs/AppConfig.dart';
import 'package:e_garden/widgets/custom_buton_component.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DictionarySysnonymTab extends StatefulWidget {
  @override
  _DictionarySysnonymTabState createState() => _DictionarySysnonymTabState();

  DictionarySysnonymTab();
}

class _DictionarySysnonymTabState extends State<DictionarySysnonymTab> {
  List<String> _listSybonyms = ['Greeting', 'Welcome', 'Slatutation', 'Hi'];

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      // Create a grid with 2 columns. If you change the scrollDirection to
      // horizontal, this produces 2 rows.
      crossAxisCount: 3,
      // Generate 100 widgets that display their index in the List.
      children: List.generate(_listSybonyms.length, (index) {
        return CustomButton(
          height: SizeConfig.blockSizeVertical*5,
          width: SizeConfig.blockSizeHorizontal*25,
          onPressed: ()=>{},
          shadowColor: Colors.grey,
          borderColor: Colors.grey,
          radius: 20,
          child: Text(
            _listSybonyms[index],
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold
            ),
          ),
        );
      }),
    );
  }
}

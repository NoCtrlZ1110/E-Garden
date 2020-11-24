import 'package:e_garden/configs/AppConfig.dart';
import 'package:e_garden/widgets/custom_buton_component.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DictionarySysnonymTab extends StatefulWidget {
  List<String> _listSynonyms;
  @override
  _DictionarySysnonymTabState createState() => _DictionarySysnonymTabState(_listSynonyms);

  DictionarySysnonymTab(this._listSynonyms);
}

class _DictionarySysnonymTabState extends State<DictionarySysnonymTab> {
  List<String> _listSynonyms;

  _DictionarySysnonymTabState(this._listSynonyms);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      children: List.generate(_listSynonyms.length, (index) {
        return CustomButton(
          height: SizeConfig.blockSizeVertical*5,
          width: SizeConfig.blockSizeHorizontal*30,
          onPressed: ()=>{},
          shadowColor: AppColors.green,
          borderColor: AppColors.green,
          radius: 20,
          child: Text(
            _listSynonyms[index],
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500
            ),
          ),
        );
      }),
    );
  }
}

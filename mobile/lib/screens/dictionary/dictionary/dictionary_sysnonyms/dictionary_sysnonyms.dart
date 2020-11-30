import 'package:e_garden/configs/AppConfig.dart';
import 'package:e_garden/core/services/dictionary/dictionary_model.service.dart';
import 'package:e_garden/screens/dictionary/dictionary/dictionary.dart';
import 'package:e_garden/widgets/custom_buton_component.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      childAspectRatio: 1/0.6,
      children: List.generate(_listSynonyms.length, (index) {
        return CustomButton(
          height: SizeConfig.blockSizeVertical * 5,
          width: SizeConfig.blockSizeHorizontal * 25,
          onPressed: () => {
           Navigator.pushReplacement(
             context,
             MaterialPageRoute(builder: (context) => DictionaryScreen(newWord: _listSynonyms[index])),
           )
          },
          shadowColor: AppColors.green,
          borderColor: AppColors.green,
          radius: 15,
          child: FittedBox(
            child: Text(
              _listSynonyms[index],
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: SizeConfig.blockSizeVertical * 2, fontWeight: FontWeight.w500),
            ),
          ),
        );
      }),
    );
  }
}

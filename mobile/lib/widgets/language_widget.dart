import 'package:e_garden/configs/AppConfig.dart';
import 'package:flutter/material.dart';

import 'drop_down_widget.dart';

class LanguageWidget extends StatelessWidget {
  final String language1;
  final String language2;
  final ValueChanged<String> onChangedLanguage1;
  final ValueChanged<String> onChangedLanguage2;

  const LanguageWidget({
    @required this.language1,
    @required this.language2,
    @required this.onChangedLanguage1,
    @required this.onChangedLanguage2,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context){
    FlatButton _changeLang = FlatButton(
      splashColor: Colors.grey[200],
      color: AppColors.green,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(1000.0),
      ),
      child: Icon(
        Icons.translate,
        color: Colors.white,
      ),
      onPressed: () {
      },
    );
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DropDownWidget(
          value: language1,
          onChangedLanguage: onChangedLanguage1,
        ),
        SizedBox(width: 12),
        _changeLang,
        SizedBox(width: 12),
        DropDownWidget(
          value: language2,
          onChangedLanguage: onChangedLanguage2,
        ),
      ],
    );
  }
}

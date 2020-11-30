import 'package:e_garden/screens/dictionary/translate/langs/translations.dart';
import 'package:flutter/material.dart';

class DropDownWidget extends StatelessWidget {
  final String value;
  final ValueChanged<String> onChangedLanguage;

  const DropDownWidget({
    @required this.value,
    @required this.onChangedLanguage,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final items = Translations.languages
        .map<DropdownMenuItem<String>>(
            (String value) => DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                ))
        .toList();

    return DropdownButton<String>(
      value: value,
      icon: Icon(Icons.expand_more, color: Colors.grey),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: Colors.black),
      onChanged: onChangedLanguage,
      items: items,
    );
  }
}

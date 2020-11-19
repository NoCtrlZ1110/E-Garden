import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DictionarySysnonymTab extends StatefulWidget {
  @override
  _DictionarySysnonymTabState createState() => _DictionarySysnonymTabState();

  DictionarySysnonymTab();
}

class _DictionarySysnonymTabState extends State<DictionarySysnonymTab> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Center(
      child: Column(
        children: [
          Icon(Icons.ac_unit),
        ],
      ),
    ));
  }
}

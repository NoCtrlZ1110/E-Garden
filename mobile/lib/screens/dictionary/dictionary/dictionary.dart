import 'package:e_garden/configs/AppConfig.dart';
import 'package:e_garden/screens/study/learn/grammar.dart';
import 'package:e_garden/screens/study/learn/listening.dart';
import 'package:e_garden/screens/study/learn/vocabulary.dart';
import 'package:e_garden/widgets/custom_tile.dart';
import 'package:e_garden/widgets/text_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DictionaryScreen extends StatefulWidget {
  @override
  _DictionaryScreenState createState() => _DictionaryScreenState();
}

class _DictionaryScreenState extends State<DictionaryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TextAppBar(
        text: "DICTIONARY",
        height: 100,
      ),
    );
  }
}

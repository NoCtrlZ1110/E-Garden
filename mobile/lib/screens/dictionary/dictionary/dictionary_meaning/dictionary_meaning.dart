import 'package:e_garden/configs/AppConfig.dart';
import 'package:e_garden/core/models/dictionary/dictionary.dart';
import 'package:e_garden/core/services/dictionary/dictionary_model.service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DictionaryMeaningTab extends StatefulWidget {
  List<Meanings_Word> _definitions;

  @override
  _DictionaryMeaningTabState createState() => _DictionaryMeaningTabState(_definitions);

  DictionaryMeaningTab(this._definitions);
}

class _DictionaryMeaningTabState extends State<DictionaryMeaningTab> {
  ScrollController _scrollController = new ScrollController();
  List<Meanings_Word> _definitions;

  _DictionaryMeaningTabState(this._definitions);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: _definitions.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.only(top: 50, left: 20, right: 20),
            padding: EdgeInsets.only(top: 20, bottom: 20, left: 10, right: 10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blueAccent),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _definitions[index].definition,
                  style: TextStyle(fontSize: 16, color: AppColors.black, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.justify,
                ),
                Text(
                  _definitions[index].example != null ? "Ex: +${_definitions[index].example}" : "",
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.grey,
                    fontWeight: FontWeight.normal,
                    fontStyle: FontStyle.italic,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          );
        });
  }
}

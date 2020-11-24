import 'dart:async';
import 'package:e_garden/configs/AppConfig.dart';
import 'package:e_garden/core/services/translate/translate_model.service.dart';
import 'package:e_garden/widgets/language_widget.dart';
import 'package:e_garden/widgets/text_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'langs/translations.dart';

// import '../../../blocs/translator_bloc.dart';
// import '../../widgets/home/result_card.dart';
// import '../../../util/responsive.dart';

class TranslateScreen extends StatefulWidget {
  @override
  _TranslateScreenState createState() => _TranslateScreenState();
}

class _TranslateScreenState extends State<TranslateScreen> {
  StreamController<String> _streamWritingController = StreamController();
  bool change;
  bool translating;
  String fromLang;
  String toLang;
  Stream<String> a;
  String language1 = Translations.languages.first;
  String language2 = Translations.languages.first;

  @override
  void initState() {
    translating = false;
    change = false;
    fromLang = "es";
    toLang = "en";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Container inputText = Container(
      height: SizeConfig.blockSizeVertical * 16,
      padding: const EdgeInsets.all(25.0),
      child: TextField(
        textAlign: TextAlign.justify,
        minLines: 1,
        maxLines: 7,
        textCapitalization: TextCapitalization.sentences,
        onChanged: (string) {
          if (string.length == 1) {
            translating = false;
            //translatorBLoC.translator("Escribiendo...");
          } else if (string.length == 0) {
            translating = false;
            //translatorBLoC.translator("");
          }
          _streamWritingController.add(string);
        },
        onSubmitted: (string) {
          //translatorBLoC.translator(string);
        },
        autocorrect: false,
        style: TextStyle(fontSize: 16.0),
        maxLength: 300,
        decoration: InputDecoration.collapsed(hintText: "Enter text ..."),
      ),
    );
    return Consumer<TranslateModel>(
      builder: (context,cart,child){
        return Scaffold(
          appBar: TextAppBar(
            text: "TRANSLATE",
            height: 100,
          ),
          body: Container(
            color: Colors.white,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  buildLanguageTitle(),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 6,
                  ),
                  Card(
                    margin: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Stack(
                      children: <Widget>[
                        inputText,
                      ],
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical,
                  ),
                  Card(
                    margin: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Stack(
                      children: <Widget>[
                        inputText,
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
       }
    );
  }

  Widget buildLanguageTitle() => LanguageWidget(
        language1: language1,
        language2: language2,
        onChangedLanguage1: (newLanguage) => setState(() {
          language1 = newLanguage;
          print(language1);
        }),
        onChangedLanguage2: (newLanguage) => setState(() {
          language2 = newLanguage;
        }),
      );
}

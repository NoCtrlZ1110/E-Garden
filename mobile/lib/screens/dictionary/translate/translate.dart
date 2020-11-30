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
  bool change;
  bool translating;
  String fromLang;
  String toLang;
  String language1 = Translations.languages.first;
  String language2 = Translations.languages.first;
  String _textTranslate;
  TextEditingController _translateController = TextEditingController();

  @override
  void initState() {
    translating = false;
    change = false;
    fromLang = "es";
    toLang = "en";
    super.initState();
    _textTranslate = "";
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TranslateModel>(builder: (context, cart, child) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: TextAppBar(
          text: "TRANSLATE",
          height: 100,
        ),
        body: Container(
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
                      Container(
                        height: SizeConfig.blockSizeVertical * 16,
                        padding: const EdgeInsets.all(25.0),
                        child: TextField(
                          textAlign: TextAlign.justify,
                          minLines: 1,
                          maxLines: 7,
                          textCapitalization: TextCapitalization.sentences,
                          controller: _translateController,
                          onChanged: (value) async {
                            //print("${_translateController.text} ${Translations.getLanguageCode(language1)} ${language2.codeUnits}");
                            if (_translateController.text.length == 1) {
                              translating = false;
                            } else if (_translateController.text.length == 0) {
                              translating = false;
                            } else {
                              translating = true;
                            }
                            if (translating) {
                              _textTranslate = _translateController.text;
                              print(_textTranslate);
                            }
                          },
                          onSubmitted: (string) {},
                          autocorrect: false,
                          style: TextStyle(fontSize: 16.0),
                          maxLength: 300,
                          decoration: InputDecoration.collapsed(
                              hintText: "Enter text ..."),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: SizeConfig.blockSizeVertical,
                ),
                FutureBuilder(
                    future: cart.translate2(_textTranslate,
                        Translations.getLanguageCode(language1),
                        Translations.getLanguageCode(language2)),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Card(
                          margin: const EdgeInsets.symmetric(horizontal: 15.0),
                          color: Colors.lightGreen,
                          child: Stack(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(25.0),
                                width: SizeConfig.blockSizeHorizontal * 100,
                                child: ConstrainedBox(
                                  constraints: BoxConstraints(
                                    minHeight: SizeConfig.blockSizeVertical *
                                        15,
                                  ),
                                  child: Text(
                                    cart.translateText,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.0,
                                    ),
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: Row(
                                  children: [
                                    IconButton(
                                      icon: Icon(
                                        Icons.volume_up_rounded,
                                        color: Colors.white,
                                      ),
                                      onPressed: () {},
                                    ),
                                    IconButton(
                                      icon: Icon(
                                        Icons.share,
                                        color: Colors.white,
                                      ),
                                      onPressed: () {},
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                      return Container();
                    }
                )
              ],
            ),
          ),
        ),
      );
    });
  }
  Widget buildLanguageTitle() =>
      LanguageWidget(
        language1: language1,
        language2: language2,
        onChangedLanguage1: (newLanguage) =>
            setState(() {
              language1 = newLanguage;
              print(language1);
            }),
        onChangedLanguage2: (newLanguage) =>
            setState(() {
              language2 = newLanguage;
            }),
      );

  // Widget resultCard() {
  //   return (_resultTranslate.isNotEmpty)
  //       ?
  //       : Container();
  // }
}
// Widget resultCard() {
//   return (_resultTranslate.isNotEmpty)
//       ?
//       : Container();
// }

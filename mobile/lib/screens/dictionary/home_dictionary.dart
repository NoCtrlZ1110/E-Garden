import 'package:e_garden/configs/AppConfig.dart';
import 'package:e_garden/screens/dictionary/dictionary/dictionary.dart';
import 'package:e_garden/screens/dictionary/translate/translate.dart';
import 'package:e_garden/screens/study/study.provider.dart';
import 'package:e_garden/widgets/custom_buton_component.dart';
import 'package:e_garden/widgets/custom_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class HomeDictionaryScreen extends StatefulWidget {
  @override
  _HomeDictionaryScreenState createState() => _HomeDictionaryScreenState();
}

class _HomeDictionaryScreenState extends State<HomeDictionaryScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<BookModel>(builder: (_, model, __) => Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          height: SizeConfig.blockSizeVertical * 77,
          child: Column(
            children: [
              Expanded(child: SizedBox()),
              CustomButton(
                backgroundColor: Colors.blue[300],
                child: TileWidget(
                  text: "Dictionary",
                  color: Colors.indigo,
                ),
                height: SizeConfig.safeBlockHorizontal * 40,
                width: SizeConfig.safeBlockHorizontal * 80,
                shadowColor: Colors.indigo,
                onPressed: () => Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.rightToLeft,
                      duration: Duration(milliseconds: 400),
                      child: DictionaryScreen()),
                ),
              ),
              SizedBox(
                height: SizeConfig.blockSizeVertical * 10,
              ),
              CustomButton(
                  backgroundColor: Colors.green[300],
                  child: TileWidget(
                    text: "Translate",
                    color: Colors.green,
                  ),
                  height: SizeConfig.safeBlockHorizontal * 40,
                  width: SizeConfig.safeBlockHorizontal * 80,
                  shadowColor: Colors.green,
                  onPressed: () => Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.rightToLeft,
                        duration: Duration(milliseconds: 400),
                        child: TranslateScreen()),
                  )),
              Expanded(child: SizedBox()),
            ],
          ),
        ),
      ),
    ),
    );
  }
}

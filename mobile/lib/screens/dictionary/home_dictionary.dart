import 'package:e_garden/configs/AppConfig.dart';
import 'package:e_garden/screens/dictionary/dictionary/dictionary.dart';
import 'package:e_garden/screens/dictionary/translate/translate.dart';
import 'package:e_garden/screens/study/study.provider.dart';
import 'package:e_garden/utils/light_color.dart';
import 'package:e_garden/widgets/custom_app_bar.dart';
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
    return SafeArea(
      child: Consumer<BookModel>(builder: (_, model, __) => Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
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
                  height: 40,
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
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ),
        ),
      )),
    );
  }
}

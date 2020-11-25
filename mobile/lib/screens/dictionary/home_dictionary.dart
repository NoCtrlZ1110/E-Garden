import 'package:e_garden/configs/AppConfig.dart';
import 'package:e_garden/screens/dictionary/dictionary/dictionary.dart';
import 'package:e_garden/screens/dictionary/translate/translate.dart';
import 'package:e_garden/widgets/custom_app_bar.dart';
import 'package:e_garden/widgets/custom_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeDictionaryScreen extends StatefulWidget {
  @override
  _HomeDictionaryScreenState createState() => _HomeDictionaryScreenState();
}

class _HomeDictionaryScreenState extends State<HomeDictionaryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
          height: 120,
          child: SafeArea(
              child: Row(
            children: [
              SizedBox(
                width: 46,
              ),
              Image.asset(
                "assets/images/logo_text.png",
                height: 40,
              ),
              Expanded(
                child: Container(),
              ),
              IconButton(
                icon: Icon(
                  Icons.logout,
                  color: AppColors.green,
                  size: 30,
                ),
                onPressed: () {
                  return PopupMenuButton(itemBuilder: (BuildContext context) {
                    return [PopupMenuItem(child: Text("ABC"))];
                  });
                },
              ),
              SizedBox(
                width: 40,
              ),
            ],
          ))),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              TileWidget(
                text: "Dictionary",
                color: AppColors.lightGreen,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DictionaryScreen()),
                  );
                },
              ),
              SizedBox(
                height: 40,
              ),
              TileWidget(
                text: "Translate",
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TranslateScreen()),
                  );
                },
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ),
      ),
    );
  }
}

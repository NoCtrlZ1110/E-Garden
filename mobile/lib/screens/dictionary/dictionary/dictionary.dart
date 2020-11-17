import 'package:e_garden/configs/AppConfig.dart';
import 'package:e_garden/screens/study/learn/grammar.dart';
import 'package:e_garden/screens/study/learn/listening.dart';
import 'package:e_garden/screens/study/learn/vocabulary.dart';
import 'package:e_garden/widgets/custom_tile.dart';
import 'package:e_garden/widgets/text_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class DictionaryScreen extends StatefulWidget {
  @override
  _DictionaryScreenState createState() => _DictionaryScreenState();
}

class _DictionaryScreenState extends State<DictionaryScreen> {
  TextEditingController _search = TextEditingController();
  bool hihi  = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TextAppBar(
        text: "DICTIONARY",
        height: 100,
      ),
      body: Column(
        children: [
          Center(
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 20, bottom: 20),
              width: SizeConfig.safeBlockHorizontal * 80,
              child: FormBuilderTextField(
                attribute: "Search",
                validators: [FormBuilderValidators.required()],
                style: TextStyle(
                    fontSize: SizeConfig.safeBlockVertical * 2.5,
                    color: AppColors.green),
                controller: _search,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: Icon(Icons.mic),
                    onPressed: () => {},
                  ),
                  contentPadding: EdgeInsets.only(
                      left: SizeConfig.safeBlockHorizontal * 5,
                      right: SizeConfig.safeBlockHorizontal * 3,
                      top: SizeConfig.safeBlockVertical * 2,
                      bottom: SizeConfig.safeBlockVertical * 2),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.green, width: 5),
                      borderRadius: BorderRadius.circular(160)),
                  labelText: "Search",
                  hintText: "Hello",
                  alignLabelWithHint: false,
                  labelStyle: TextStyle(
                      fontSize: SizeConfig.safeBlockVertical * 2.5,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
          Center(
            child: Container(
              width: SizeConfig.blockSizeHorizontal * 70,
              height: SizeConfig.blockSizeVertical * 17,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFFF7FAF9), Color(0xFFCEE3D9)]),
                borderRadius: BorderRadius.circular(16),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(1.0, 6.0),
                    blurRadius: 10.0,
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, left: 15.0),
                        child: Text(
                          'Hello',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'RobotoMono',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '/həˈloʊ/',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                            fontStyle: FontStyle.italic,
                            fontFamily: 'RobotoMono',
                          ),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(top: 8.0, left: 15.0),
                          child: IconButton(
                            icon: Icon(
                              Icons.volume_down_rounded,
                              color: Colors.black,
                              size: 35,
                            ),
                          ))
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          'exclamation, noun',
                          style: TextStyle(
                            color: Colors.black38,
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(top: 8.0, left: 15.0),
                          child: IconButton(
                            icon: Icon(
                              Icons.add_box_sharp,
                              color: Colors.black,
                              size: 35,
                            ),
                          ))
                    ],
                  )
                ],
              ),
            ),
          ),
          Row(
            children: [
              FlatButton(
                child: Text("Ahihi"),
                onPressed: () {
                  setState(() {
                    hihi = !hihi;
                  });
                },
              ),
            ],
          ),
          (hihi) ? Text("manh") : Text("kien")
        ],
      ),
    );
  }

}

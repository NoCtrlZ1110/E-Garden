import 'package:e_garden/configs/AppConfig.dart';
import 'package:e_garden/screens/study/learn/learn.provider.dart';
import 'package:e_garden/widgets/detail_container.dart';
import 'package:e_garden/widgets/text_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GrammarScreen extends StatefulWidget {
  @override
  _GrammarScreenState createState() => _GrammarScreenState();
  final int bookId;
  final int unitId;
  GrammarScreen({this.bookId, this.unitId});
}

class _GrammarScreenState extends State<GrammarScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<LearnModel>(builder: (_, model, __) => Scaffold(
        appBar: TextAppBar(
          text: "GRAMMAR",
          height: SizeConfig.blockSizeVertical * 8,
          grade: "Grade ${widget.bookId}",
        ),
        body: Container(
          height: SizeConfig.screenHeight,
          child: Stack(
            children: [
              Positioned(
                  bottom: 0,
                  child: Opacity(
                      opacity: 0.7,
                      child: Image.asset(
                        'assets/images/backgroundlearn.png',
                        width: SizeConfig.screenWidth,
                        fit: BoxFit.fitWidth,
                      ))),
              Center(
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: SizeConfig.blockSizeVertical * 25,
                      width: SizeConfig.screenWidth * 0.8,
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Text(
                        model.grammar[model.index],
                        style: TextStyle(
                            fontSize: SizeConfig.blockSizeVertical * 3,
                            color: AppColors.green,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Text(
                      model.meaningSentences[model.index],
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                          color: AppColors.green),
                    ),
                    DetailContainer(
                      isGrammar: true,
                      type: model.typeSentences[model.index] != null ?  model.typeSentences[model.index] : '',
                      example: model.exampleSentences[model.index],
                    ),
                    SizedBox(height: 10)
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                ),
              ),
            ],
          ),
        )
      )),
    );
  }
}

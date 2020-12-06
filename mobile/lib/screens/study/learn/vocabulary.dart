import 'package:e_garden/configs/AppConfig.dart';
import 'package:e_garden/screens/study/learn/learn_model.dart';
import 'package:e_garden/widgets/detail_container.dart';
import 'package:e_garden/widgets/text_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:provider/provider.dart';

class VocabularyScreen extends StatefulWidget {
  @override
  _VocabularyScreenState createState() => _VocabularyScreenState();
}

class _VocabularyScreenState extends State<VocabularyScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<LearnModel>(
          builder: (_, model, __) => Scaffold(
                appBar: TextAppBar(
                  text: "VOCABULARY",
                  height: SizeConfig.blockSizeVertical * 8,
                ),
                body: SingleChildScrollView(
                  child: Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 80,
                        ),
                        FlipCard(
                            speed: 1000,
                            onFlip: () {
                              Future.delayed(Duration(milliseconds: 500), () => model.flipCard());
                            },
                            front: (model.isFrontCard)
                                ? card(
                                    model,
                                    Text(
                                      model.words[model.index],
                                      style:
                                          TextStyle(fontSize: 50, color: AppColors.green, fontWeight: FontWeight.w600),
                                    ),
                                  )
                                : card(
                                    model,
                                    Image.asset(
                                      model.wordImages[model.index],
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                            back: (!model.isFrontCard)
                                ? card(
                                    model,
                                    Image.asset(
                                      model.wordImages[model.index],
                                      fit: BoxFit.fill,
                                    ),
                                  )
                                : card(
                                    model,
                                    Text(
                                      model.words[model.index],
                                      style:
                                          TextStyle(fontSize: 50, color: AppColors.green, fontWeight: FontWeight.w600),
                                    ),
                                  )),
                        SizedBox(
                          height: 50,
                        ),
                        Text(
                          model.meaningWords[model.index],
                          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600, color: AppColors.green),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        DetailContainer(
                          type: model.typeWords[model.index],
                          example: model.exampleWords[model.index],
                          previous: () {
                            model.decrease(model.index);
                            if (!model.isFrontCard) model.flipCard();
                          },
                          next: () {
                            model.increase(model.index);
                            if (!model.isFrontCard) model.flipCard();
                          },
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    ),
                  ),
                ),
              )),
    );
  }

  Widget card(LearnModel model, Widget child) {
    return Container(
        alignment: Alignment.center,
        height: 200,
        width: SizeConfig.blockSizeHorizontal * 50,
        padding: EdgeInsets.all(8.0),
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
        child: child);
  }
}

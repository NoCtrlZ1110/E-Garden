import 'package:e_garden/configs/AppConfig.dart';
import 'package:e_garden/screens/study/learn/learn.provider.dart';
import 'package:e_garden/widgets/detail_container.dart';
import 'package:e_garden/widgets/text_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:provider/provider.dart';

class VocabularyScreen extends StatefulWidget {
  @override
  _VocabularyScreenState createState() => _VocabularyScreenState();
  final int bookId;
  final int unitId;

  VocabularyScreen({this.bookId, this.unitId});
}

class _VocabularyScreenState extends State<VocabularyScreen> {
  @override
  Widget build(BuildContext context) {
    var model = Provider.of<LearnModel>(context, listen: false);
    return SafeArea(
        child: FutureBuilder(
      future: model.fetchListVocab(bookId: widget.bookId, unitId: widget.unitId),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasData) {
          return Scaffold(
              appBar: TextAppBar(
                text: "VOCABULARY",
                height: SizeConfig.blockSizeVertical * 8,
              ),
              body: Container(
                height: SizeConfig.screenHeight,
                width: double.infinity,
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
                    PageView.builder(
                        onPageChanged: (value) {
                          if (!model.isFrontCard) model.flipCard();
                        },
                        itemCount: model.words.items.length,
                        itemBuilder: (BuildContext context, int index) => Center(
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 50,
                                  ),
                                  FlipCard(
                                      speed: 1000,
                                      onFlip: () {
                                        model.flipCard();
                                      },
                                      front: card(
                                        model,
                                        Text(
                                          model.words.items[index].key,
                                          style: TextStyle(
                                              fontSize: 50, color: AppColors.green, fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                      back: card(
                                        model,
                                        Image.asset(
                                          'assets/images/logo.png',
                                          fit: BoxFit.fill,
                                        ),
                                      )),
                                  SizedBox(
                                    height: 50,
                                  ),
                                  Text(
                                    model.words.items[index].meaning,
                                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600, color: AppColors.green),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    height: 50,
                                  ),
                                  DetailContainer(
                                    //type: model.typeWords[model.index],
                                    type: 'Noun',
                                    example: model.words.items[index].example,
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                ],
                              ),
                            )),
                  ],
                ),
              ));
        }
        return CircularProgressIndicator();
      },
    ));
  }

  Widget card(LearnModel model, Widget child) {
    return Container(
        alignment: Alignment.center,
        height: SizeConfig.blockSizeHorizontal * 50,
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
        child: FittedBox(
          child: child,
        ));
  }
}

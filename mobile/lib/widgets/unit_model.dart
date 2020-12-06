import 'package:e_garden/configs/AppConfig.dart';
import 'package:e_garden/screens/study/study.provider.dart';
import 'package:e_garden/utils/light_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Widget unitModel(int index, context){
  return Consumer<BookModel>(builder: (_, model, __) => Container(
      height: SizeConfig.blockSizeVertical * 12,
      child: GestureDetector(
        onTap: (){
          model.changeUnit(index);
          Navigator.pop(context);
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              right: 60,
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color:  LightColors().buttonLightColor[model.getGrade()].withOpacity(0.8),
                      border: Border.all(
                          color: Color(0xFFEBEEF2),
                          width: 5
                      )
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top: 8, bottom: 8, left: 14, right: 30),
                    child: Text('Unit', style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w800
                    ),),
                  )
              ),
            ),
            Positioned(
              right: 20,
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: LightColors().bookColor[model.getGrade()],
                    border: Border.all(
                        color: Color(0xFFEBEEF2),
                        width: 5
                    )
                ),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Container(
                    width: SizeConfig.blockSizeHorizontal * 5,
                    child: FittedBox(
                      child: Text(index.toString(), style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w800
                      )
                        ,),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      )
  ));
}

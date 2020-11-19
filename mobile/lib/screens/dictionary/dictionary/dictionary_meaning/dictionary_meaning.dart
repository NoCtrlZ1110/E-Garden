import 'package:dotted_border/dotted_border.dart';
import 'package:e_garden/configs/AppConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DictionaryMeaningTab extends StatefulWidget {
  @override
  _DictionaryMeaningTabState createState() => _DictionaryMeaningTabState();

  DictionaryMeaningTab();
}

class _DictionaryMeaningTabState extends State<DictionaryMeaningTab> {
  ScrollController _scrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          physics: BouncingScrollPhysics(),
          controller: _scrollController,
          scrollDirection: Axis.vertical,
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: EdgeInsets.all(20),
              child: DottedBorder(
                dashPattern: [6, 6],
                borderType: BorderType.RRect,
                color: AppColors.black,
                strokeWidth: 3,
                strokeCap: StrokeCap.round,
                radius: Radius.circular(20),
                child: Container(
                  height: SizeConfig.blockSizeVertical*2,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: index%2==0? Colors.lightGreen: Colors.lime,
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color:AppColors.grey,
                          offset: Offset(0.0, 6.0),
                          blurRadius: 10.0)
                    ],
                  ),
                  constraints: BoxConstraints(
                    minHeight: SizeConfig.blockSizeVertical * 20,
                    minWidth: double.infinity,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Text(
                          'Used as a greeting or to begin a phone conversation.',
                          style: TextStyle(
                              fontSize: 20,
                              color: AppColors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 20),
                      Flexible(
                        child: Text(
                          'Ex: hello there, Katie!',
                          style: TextStyle(
                              fontSize: 20,
                              color: AppColors.grey,
                              fontWeight: FontWeight.normal,
                              fontStyle: FontStyle.italic),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}

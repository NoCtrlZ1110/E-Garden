import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:e_garden/configs/AppConfig.dart';
import 'package:e_garden/widgets/detail_container.dart';
import 'package:e_garden/widgets/text_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'learn_model.dart';

class ListeningScreen extends StatefulWidget {
  @override
  _ListeningScreenState createState() => _ListeningScreenState();
}

class _ListeningScreenState extends State<ListeningScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<LearnModel>(
          builder: (_, model, __) => Scaffold(
                appBar: TextAppBar(
                  text: "LISTENING",
                  height: SizeConfig.blockSizeVertical * 8,
                ),
                body: Center(
                  child: Column(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.volume_up, color: Color(0xFF59AA6C)),
                        iconSize: SizeConfig.blockSizeVertical * 7,
                        padding: EdgeInsets.zero,
                      ),
                      CarouselSlider.builder(
                          itemCount: null,
                          itemBuilder: null,
                          options: null,
                      ),
                      DottedBorder(
                        padding: EdgeInsets.all(20),
                          color: Color(0xFF59AA6C),
                          borderType: BorderType.RRect,
                          radius: Radius.circular(40),
                          strokeWidth: 2,
                          dashPattern: [13, 11],
                          child: Container(
                            width: SizeConfig.blockSizeHorizontal * 70,
                            height: SizeConfig.blockSizeHorizontal * 70,
                            child: Text(
                              "My best friend is Ha. We’ve been friends for a long time. We used to live in Nguyen Cong Tru Residential in Hanoi. Her family moved to Haiphong in 1985. It is said that Haiphong people are cold, but Ha is really, really friendly. I started to set to know her when I was going on a two-day trip to Doson last year and I didn't know anybody there.",
                              style: TextStyle(
                                color: Color(0xFF8D3541),
                                fontSize: 18,
                                fontWeight: FontWeight.w700
                              ),
                            ),
                          ))
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                  ),
                ),
              )),
    );
  }
}

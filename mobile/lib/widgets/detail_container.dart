import 'package:audioplayers/audioplayers.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:e_garden/configs/AppConfig.dart';
import 'package:e_garden/widgets/button_green.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

// ignore: must_be_immutable
class DetailContainer extends StatefulWidget {
  String type;
  String example;
  Function previous;
  Function next;
  String sound;
  bool isGrammar;

  DetailContainer({this.next, this.previous, this.type, this.example, this.sound, this.isGrammar});

  @override
  _DetailContainerState createState() => _DetailContainerState();
}

class _DetailContainerState extends State<DetailContainer> {
  bool bookmark = false;
  AudioPlayer audioPlayer = AudioPlayer();

  @override
  void dispose() {
    // TODO: implement dispose
    audioPlayer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      dashPattern: [6, 6],
      borderType: BorderType.RRect,
      color: AppColors.green,
      strokeWidth: 2,
      strokeCap: StrokeCap.round,
      radius: Radius.circular(20),
      child: Container(
        width: SizeConfig.screenWidth * 0.8,
        margin: EdgeInsets.only(top: 15, bottom: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  widget.type,
                  style: TextStyle(fontSize: 28, color: AppColors.green),
                ),
                SizedBox(
                  width: 20,
                ),
                (!widget.isGrammar) ? IconButton(
                    icon: Icon(
                      Icons.volume_down,
                      color: AppColors.red,
                      size: 35,
                    ),
                    onPressed: () async => await audioPlayer.play(widget.sound)) : SizedBox()
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              margin: EdgeInsets.only(left: 20),
              width: SizeConfig.screenWidth * 0.73,
              child: Text(
                widget.example,
                style: TextStyle(fontSize: 20, color: AppColors.brown),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

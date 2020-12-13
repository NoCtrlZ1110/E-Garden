import 'package:e_garden/configs/AppConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardModel extends StatefulWidget {
  @override
  _CardModelState createState() => _CardModelState();
  final double height;
  final double width;
  final Color backgroundColor;
  final Function onTap;
  final double radius;
  final String labelText;
  final String childText;
  final double radiusBtn;
  final bool learn;
  final String backgroundImagePath;

  CardModel(
      {this.width,
      this.height,
      this.backgroundColor,
      this.onTap,
      this.radius,
      this.childText,
      this.labelText,
      this.radiusBtn,
      this.learn,
      this.backgroundImagePath});
}

class _CardModelState extends State<CardModel> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(widget.radius), color: widget.backgroundColor, boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 5,
          blurRadius: 7,
          offset: Offset(0, 3),
        )
      ]),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(widget.radius),
            child: Image.asset(
              widget.backgroundImagePath,
              height: widget.height,
              fit: BoxFit.contain,
            ),
          ),
          Container(
            height: widget.height,
            width: widget.width / 1.65,
            alignment: Alignment.center,
            child: Column(
              children: [
                Expanded(child: SizedBox()),
                Padding(
                  padding: EdgeInsets.only(top: 10, left: 10, bottom: 10),
                  child: Text(
                    widget.labelText,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: (widget.learn) ? widget.height / 8 : widget.height / 7),
                  ),
                ),
                Text(
                  widget.childText,
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: widget.height / 13),
                ),
                (!widget.learn)
                    ? GestureDetector(
                        onTap: widget.onTap,
                        child: Container(
                          margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 2),
                          height: widget.height / 6,
                          width: widget.width / 4,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(widget.radiusBtn),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(0, 3),
                                )
                              ]),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Icon(
                                Icons.play_arrow_rounded,
                                size: 20,
                                color: widget.backgroundColor,
                              ),
                              Text('Start',
                                  style: TextStyle(
                                      color: widget.backgroundColor, fontSize: 15, fontWeight: FontWeight.w700)),
                              SizedBox(width: 7)
                            ],
                          ),
                        ),
                      )
                    : SizedBox(),
                SizedBox(height: 5),
                Expanded(child: SizedBox()),
              ],
            ),
          )
        ],
      ),
    );
  }
}

import 'package:e_garden/configs/AppConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:bordered_text/bordered_text.dart';
import 'package:auto_size_text/auto_size_text.dart';

class TileWidget extends StatefulWidget {
  final String text, leftText, rightText;
  final Icon icon;
  final Color color;

  TileWidget(
      {Key key,
      @required this.text,
      this.leftText,
      this.rightText,
      this.icon,
      this.color})
      : super(key: key);

  @override
  _TileWidgetState createState() => _TileWidgetState();
}

class _TileWidgetState extends State<TileWidget> {
  @override
  Widget build(BuildContext context) {
    return Ink(
      width: SizeConfig.screenWidth * 0.8,
      height: 150,
      decoration: BoxDecoration(
        color: widget.color != null ? widget.color : AppColors.green,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(3, 3),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            child: Opacity(
              opacity: 0.75,
              child: SvgPicture.asset(
                "assets/svgs/tile/waves.svg",
                color: AppColors.black,
                height: 90,
              ),
            ),
            bottom: 45,
            left: 20,
          ),
          Positioned(
            child: Container(
              alignment: Alignment.centerLeft,
              width: SizeConfig.screenWidth * 0.7,
              height: 80,
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: BorderedText(
                  strokeWidth: SizeConfig.blockSizeVertical,
                  strokeColor: Colors.white,
                  child: Text(
                    widget.text,
                    style: TextStyle(
                        fontSize: SizeConfig.blockSizeVertical * 6,
                        fontWeight: FontWeight.w600,
                        letterSpacing: -2,
                        color: widget.color
                    ),
                  ),
                ),
              ),
            ),
            bottom: 35,
            left: 20,
          ),
          Positioned(
            child: Icon(
              Icons.keyboard_arrow_right_rounded,
              color: widget.color,
              size: 40,
            ),
            right: 10,
            top: 10,
          ),
          Positioned(
            child: Text(
              widget.leftText != null ? widget.leftText : '',
              style: TextStyle(fontSize: 16, color: widget.color, fontWeight: FontWeight.w800),
            ),
            left: 25,
            bottom: 10,
          ),
          Positioned(
            child: Text(
              widget.rightText != null ? widget.rightText : '',
              style: TextStyle(fontSize: 16, color: widget.color, fontWeight: FontWeight.w800),
            ),
            right: 25,
            bottom: 10,
          )
        ],
      ),
    );
  }
}

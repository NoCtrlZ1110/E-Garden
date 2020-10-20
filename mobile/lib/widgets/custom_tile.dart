import 'package:e_garden/configs/AppConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TileWidget extends StatefulWidget {
  final String text, leftText, rightText;
  final Icon icon;
  final Function press;
  final Color color;

  TileWidget(
      {Key key,
      @required this.text,
      this.leftText,
      this.rightText,
      this.icon,
      @required this.press,
      this.color})
      : super(key: key);

  @override
  _TileWidgetState createState() => _TileWidgetState();
}

class _TileWidgetState extends State<TileWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (widget.press != null) {
          widget.press();
        }
      }, // needed
      splashColor: AppColors.black.withOpacity(0.1),
      child: Ink(
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
              child: Text(
                widget.text,
                style: TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -2,
                    color: Colors.white),
              ),
              top: 40,
              left: 20,
            ),
            Positioned(
              child: Icon(
                Icons.keyboard_arrow_right_rounded,
                color: Colors.white,
                size: 40,
              ),
              right: 10,
              top: 10,
            ),
            Positioned(
              child: Text(
                widget.leftText != null ? widget.leftText : '',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              left: 25,
              bottom: 10,
            ),
            Positioned(
              child: Text(
                widget.rightText != null ? widget.rightText : '',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              right: 25,
              bottom: 10,
            )
          ],
        ),
      ),
    );
  }
}

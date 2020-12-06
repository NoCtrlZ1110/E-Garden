import 'package:e_garden/configs/AppConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonGreen extends StatefulWidget {
  final String text;
  final double height, width;
  final Icon icon;
  final Function press;
  final Color textColor;

  ButtonGreen({
    Key key,
    @required this.height,
    @required this.width,
    @required this.text,
    this.icon,
    this.textColor,
    @required this.press,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ButtonGreenState();
  }
}

class _ButtonGreenState extends State<ButtonGreen> {
  bool animated = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
          width: widget.width,
          height: widget.height + 8,
          child: Stack(
            children: [
              Positioned(
                bottom: 0,
                child: Container(
                  width: widget.width,
                  height: widget.height,
                  decoration: BoxDecoration(
                    color: AppColors.buttonShadow,
                    borderRadius: BorderRadius.circular(90),
                  ),
                ),
              ),
              AnimatedPositioned(
                onEnd: () {
                  setState(() {
                    if (!animated) {
                      animated = true;
                      if (widget.press != null) {
                        widget.press();
                      }
                    }
                  });
                },
                top: animated ? 0 : 8,
                child: Container(
                  width: widget.width,
                  height: widget.height,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          AppColors.buttonBlend1,
                          AppColors.buttonBlend2
                        ]),
                    borderRadius: BorderRadius.circular(90),
                  ),
                  child: Row(children: [
                    Expanded(child: SizedBox()),
                    (widget.icon != null) ? widget.icon : SizedBox(),
                    (widget.icon != null)
                        ? Expanded(child: SizedBox())
                        : SizedBox(),
                    Text(
                      widget.text,
                      style: TextStyle(
                        color: widget.textColor == null
                            ? Colors.white
                            : widget.textColor,
                        fontSize: widget.height / 2.75,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Expanded(child: SizedBox()),
                  ]),
                ),
                duration: Duration(milliseconds: 100),
              ),
            ],
          )),
      onTap: () {
        setState(() {
          if (animated) {
            animated = false;
          }
        });
      },
    );
  }
}

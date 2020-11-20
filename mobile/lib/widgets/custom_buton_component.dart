import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final Widget child;
  final double height;
  final double width;
  final Alignment alignment;
  final double radius;
  final double elevation;
  final Color shadowColor;
  final bool deactivate;
  final Color backgroundColor;
  final double shadowHeight;
  final double shadowWidth;
  final Function onPressed;
  final Color borderColor;

  CustomButton(
      {@required this.child,
        @required this.height,
        @required this.width,
        @required this.shadowColor,
        @required this.onPressed,
        this.deactivate = false,
        this.alignment,
        this.shadowHeight,
        this.elevation,
        this.borderColor,
        this.shadowWidth,
        this.radius,
        this.backgroundColor})
      : assert(child != null);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CustomButtonState();
  }
}

class _CustomButtonState extends State<CustomButton> {
  bool onClickBool = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          if (!widget.deactivate) {
            setState(() {
              onClickBool = true;
            });
            Future.delayed(const Duration(milliseconds: 100), () {
              setState(() {
                onClickBool = false;
              });
              widget.onPressed();
            });
          }
        },
        child: Container(
          height: widget.elevation != null ? widget.height + widget.elevation : widget.height + 8,
          width: widget.width,
          alignment: Alignment.center,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                  bottom: 0,
                  child: Container(
                      height: widget.shadowHeight ?? widget.height,
                      width: widget.shadowWidth ?? widget.width,
                      decoration: BoxDecoration(
                        color: widget.shadowColor,
                        borderRadius: BorderRadius.all(Radius.circular(widget.radius ?? 10)),
                      ))),
              AnimatedPositioned(
                child: Container(
                    alignment: widget.alignment ?? Alignment.center,
                    height: widget.height,
                    width: widget.width,
                    decoration: BoxDecoration(
                        color: widget.backgroundColor ?? Colors.white,
                        border: Border.all(color: widget.borderColor ?? Colors.transparent, width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(widget.radius ?? 10))),
                    child: widget.child),
                duration: Duration(milliseconds: 100),
                bottom: onClickBool ? 0 : widget.elevation ?? 8,
              )
            ],
          ),
        ));
  }
}

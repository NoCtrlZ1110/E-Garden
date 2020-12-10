import 'package:e_garden/configs/AppConfig.dart';
import 'package:flutter/material.dart';

class CourseModel extends StatefulWidget {
  @override
  _CourseModelState createState() => _CourseModelState();
  final double width;
  final double height;
  final double radius;
  final String labelText;
  final String childText;
  final Function onTap;
  final double radiusBtn;
  final String imageChildPath;
  final Color backgroundImageColor;

  CourseModel(
      {this.width,
      this.height,
      this.radius,
      this.labelText,
      this.childText,
      this.onTap,
      this.radiusBtn,
        this.imageChildPath,
        this.backgroundImageColor
      });
}

class _CourseModelState extends State<CourseModel> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(widget.radius), color: Colors.grey[300], boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.4),
          spreadRadius: 5,
          blurRadius: 7,
          offset: Offset(0, 3),
        )
      ]),
      child: Row(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(widget.radius),
              child: Container(
                child: Image.asset(
                  widget.imageChildPath,
                  width: SizeConfig.blockSizeHorizontal * 32,
                  height: widget.height,
                  fit: BoxFit.fitHeight,
                ),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(widget.radius), color: widget.backgroundImageColor),
              )),
          Expanded(child: SizedBox()),
          Column(
            children: [
              Expanded(child: SizedBox()),
              Text(
                widget.labelText,
                style: TextStyle(fontSize: 23, color: Colors.black.withOpacity(0.75), fontWeight: FontWeight.w800),
              ),
              Text(
                widget.childText,
                style: TextStyle(fontSize: 18, color: Colors.grey, fontWeight: FontWeight.w700),
              ),
              Expanded(child: SizedBox()),
            ],
          ),
          Expanded(child: SizedBox()),
          Column(
            children: [
              Expanded(child: SizedBox()),
              GestureDetector(
                onTap: widget.onTap,
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: Text(
                      'Start',
                      style: TextStyle(fontWeight: FontWeight.w800, color: Color(0xFFff8076)),
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(widget.radius),
                    color: Colors.grey.withOpacity(0.25),
                  ),
                ),
              ),
              GestureDetector(
                  onTap: widget.onTap, child: Icon(Icons.navigate_next_sharp, color: Color(0xFFff8076), size: 35)),
              Expanded(child: SizedBox()),
            ],
          ),
          Expanded(child: SizedBox()),
        ],
      ),
    );
  }
}

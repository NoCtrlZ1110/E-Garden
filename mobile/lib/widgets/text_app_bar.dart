import 'package:e_garden/configs/AppConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextAppBar extends PreferredSize {
  final String text;
  final double height;
  final Color color;

  TextAppBar({
    @required this.text,
    this.height = kToolbarHeight,
    this.color,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: preferredSize.height,
      color: color != null ? color : Colors.white,
      alignment: Alignment.center,
      child: SafeArea(
          child: Row(
        children: [
          SizedBox(
            width: SizeConfig.screenWidth * 0.075,
          ),
          GestureDetector(
            child: Text(
              "BACK",
              style: TextStyle(
                  color: AppColors.green,
                  fontWeight: FontWeight.w700,
                  fontSize: 18),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          Expanded(
            child: Container(),
          ),
          RaisedButton(
              onPressed: () {},
              child: Text(
                text,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
              color: AppColors.green,
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              )),
          Expanded(
            child: Container(),
          ),
          GestureDetector(
            child: Text(
              "UNIT 1",
              style: TextStyle(
                  color: AppColors.green,
                  fontWeight: FontWeight.w700,
                  fontSize: 18),
            ),
            onTap: () {},
          ),
          SizedBox(
            width: SizeConfig.screenWidth * 0.075,
          )
        ],
      )),
    );
  }
}

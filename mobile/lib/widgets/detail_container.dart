import 'package:dotted_border/dotted_border.dart';
import 'package:e_garden/configs/AppConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'button_green.dart';

class DetailContainer extends StatefulWidget {
  String text_type;
  String text_description;
<<<<<<< HEAD

  DetailContainer({
    Key key,
    @required this.text_type,
    @required this.text_description,
  }) : super(key: key);
=======
  Function previous;
  Function next;

  DetailContainer(
      {Key key,
      @required this.text_type,
      @required this.text_description,
      this.previous,
      this.next})
      : super(key: key);
>>>>>>> 8940da5cf9d525b22e87d02ce8c6ea8256d6a903

  @override
  _DetailContainerState createState() => _DetailContainerState();
}

class _DetailContainerState extends State<DetailContainer> {
<<<<<<< HEAD
=======
  bool bookmark = false;
>>>>>>> 8940da5cf9d525b22e87d02ce8c6ea8256d6a903
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
        height: 220,
        child: Stack(
          children: [
            Positioned(
              child: Text(
                widget.text_type,
                style: TextStyle(fontSize: 28, color: AppColors.green),
              ),
              left: 25,
              top: 20,
            ),
            Positioned(
<<<<<<< HEAD
              child: Icon(
                Icons.bookmark_border,
                color: AppColors.red,
                size: 45,
              ),
=======
              child: GestureDetector(
                  onTap:  () {
                    setState(() {
                      bookmark = !bookmark;
                    });
                  },
                  child: Icon(
                    bookmark ? Icons.bookmark_outlined : Icons.bookmark_border,
                    color: AppColors.red,
                    size: 45,
                  )),
>>>>>>> 8940da5cf9d525b22e87d02ce8c6ea8256d6a903
              top: 20,
              right: 20,
            ),
            Positioned(
              child: Text(
                widget.text_description,
                style: TextStyle(fontSize: 20, color: AppColors.brown),
              ),
              left: 25,
              top: 70,
            ),
            Positioned(
              child: ButtonGreen(
<<<<<<< HEAD
=======
                press: () {
                  if (widget.previous != null) {
                    widget.previous();
                  }
                },
>>>>>>> 8940da5cf9d525b22e87d02ce8c6ea8256d6a903
                height: 40,
                width: 130,
                text: 'previous',
              ),
              bottom: 20,
              left: 20,
            ),
            Positioned(
              child: ButtonGreen(
<<<<<<< HEAD
=======
                press: () {
                  if (widget.previous != null) {
                    widget.next();
                  }
                },
>>>>>>> 8940da5cf9d525b22e87d02ce8c6ea8256d6a903
                height: 40,
                width: 130,
                text: 'next',
              ),
              bottom: 20,
              right: 20,
            )
          ],
        ),
      ),
    );
  }
}

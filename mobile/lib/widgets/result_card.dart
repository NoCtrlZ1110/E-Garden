import 'package:e_garden/configs/AppConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResultStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 15.0),
      color: Colors.indigo,
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(25.0),
            width: SizeConfig.blockSizeHorizontal * 100,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: SizeConfig.blockSizeVertical * 15,
              ),
              child: Text(
                "Hi",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: IconButton(
              icon: Icon(
                Icons.share,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}

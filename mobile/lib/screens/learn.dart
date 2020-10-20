import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LearnScreen extends StatefulWidget {
  @override
  _LearnScreenState createState() => _LearnScreenState();
}

class _LearnScreenState extends State<LearnScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Learn Screen"),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            "Add widgets here!",
            style: TextStyle(fontSize: 30),
          )
        ]),
      ),
    );
  }
}

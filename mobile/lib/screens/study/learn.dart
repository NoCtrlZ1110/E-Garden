import 'package:e_garden/configs/AppConfig.dart';
import 'package:e_garden/widgets/custom_tile.dart';
import 'package:e_garden/widgets/text_app_bar.dart';
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
      appBar: TextAppBar(
        text: "LEARN",
        height: 100,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              TileWidget(
                text: "Vocabulary",
                color: AppColors.lightBlue,
                leftText: "15 Units",
                rightText: "95%",
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {}),
                  );
                },
              ),
              SizedBox(
                height: 40,
              ),
              TileWidget(
                text: "Grammar",
                color: AppColors.lightBlue,
                leftText: "23 Units",
                rightText: "37%",
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {}),
                  );
                },
              ),
              SizedBox(
                height: 40,
              ),
              TileWidget(
                color: AppColors.lightBlue,
                text: "Listening",
                leftText: "51 Units",
                rightText: "09%",
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {}),
                  );
                },
              ),
              SizedBox(
                height: 20,
              )
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ),
      ),
    );
  }
}

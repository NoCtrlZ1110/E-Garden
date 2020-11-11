<<<<<<< HEAD
=======
import 'dart:convert';

>>>>>>> 8940da5cf9d525b22e87d02ce8c6ea8256d6a903
import 'package:e_garden/configs/AppConfig.dart';
import 'package:e_garden/widgets/detail_container.dart';
import 'package:e_garden/widgets/text_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
<<<<<<< HEAD
=======
import 'package:flutter/services.dart';
>>>>>>> 8940da5cf9d525b22e87d02ce8c6ea8256d6a903

class VocabularyScreen extends StatefulWidget {
  @override
  _VocabularyScreenState createState() => _VocabularyScreenState();
}

class _VocabularyScreenState extends State<VocabularyScreen> {
<<<<<<< HEAD
  String word = 'Rain';
  String meaning = 'Cơn mưa';
  String type = 'Noun';
  String description = "don't go out in the rain\ntrời mưa đừng đi ra ngoài";
=======
  var data;
  int index = 0;

  next() {
    if (data != null) {
      setState(() {
        if (index + 2 > data.length)
          index = 0;
        else
          index++;
      });
    }
  }

  previous() {
    if (data != null) {
      setState(() {
        if (index - 1 < 0)
          index = data.length - 1;
        else
          index--;
      });
    }
  }

  loadJson() async {
    String fakedata =
        await rootBundle.loadString('assets/data/vocabulary.json');
    setState(() {
      data = json.decode(fakedata);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadJson();
  }
>>>>>>> 8940da5cf9d525b22e87d02ce8c6ea8256d6a903

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TextAppBar(
        text: "VOCABULARY",
        height: 100,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 80,
              ),
              Container(
                alignment: Alignment.center,
                height: 200,
                width: SizeConfig.screenWidth * 0.6,
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Text(
<<<<<<< HEAD
                  word,
=======
                  data != null ? data.elementAt(index)["word"] : 'null',
>>>>>>> 8940da5cf9d525b22e87d02ce8c6ea8256d6a903
                  style: TextStyle(
                      fontSize: 50,
                      color: AppColors.green,
                      fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Text(
<<<<<<< HEAD
                meaning,
=======
                data != null ? data.elementAt(index)["meaning"] : '',
>>>>>>> 8940da5cf9d525b22e87d02ce8c6ea8256d6a903
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: AppColors.green),
              ),
              SizedBox(
                height: 50,
              ),
<<<<<<< HEAD
              DetailContainer(text_type: type, text_description: description),
=======
              DetailContainer(
                text_type: data != null ? data.elementAt(index)["type"] : '',
                text_description:
                    data != null ? data.elementAt(index)["description"] : '',
                previous: previous,
                next: next,
              ),
>>>>>>> 8940da5cf9d525b22e87d02ce8c6ea8256d6a903
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ),
      ),
    );
  }
}

import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_garden/configs/AppConfig.dart';
import 'package:e_garden/screens/study/study.provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ImageSlider extends StatefulWidget {
  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  CarouselSlider carouselSlider;
  int _current;
  Widget build(BuildContext context) {
    _current = Provider.of<BookModel>(context, listen: false).getGrade();
    return Container(
      height: SizeConfig.blockSizeVertical * 25,
      child: CarouselSlider.builder(
        itemBuilder: (context, index) => listClassImage(index, _current),
        options: CarouselOptions(
            viewportFraction: 0.8,
            initialPage: _current,
            autoPlay: false,
            enlargeCenterPage: true,
            aspectRatio: 2,
            onPageChanged: (index, reason) {
              setState(() {
                Provider.of<BookModel>(context, listen: false).setGrade(index);
              });
            }),
        itemCount: classImage.length,
      ),
    );
  }
  listClassImage(int index, int _current) {
    return Container(
        decoration: BoxDecoration(
          color: (index == _current) ? Color(0xFFFFC639) : Color(0xFFDEF0FD),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 5,
              blurRadius: 12,
              offset: Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
        width: SizeConfig.safeBlockHorizontal * 80,
        padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 8),
        child: Image.asset(classImage[index]));
  }
  static List<String> classImage = [
    'assets/images/class/class1.png',
    'assets/images/class/class2.png',
    'assets/images/class/class3.png',
    'assets/images/class/class4.png',
    'assets/images/class/class5.png',
  ];
}


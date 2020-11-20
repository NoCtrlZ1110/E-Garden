import 'package:e_garden/configs/AppConfig.dart';
import 'package:e_garden/core/models/dictionary/dictionary.dart';
import 'package:e_garden/screens/dictionary/dictionary/dictionary_meaning/dictionary_meaning.dart';
import 'package:e_garden/screens/dictionary/dictionary/dictionary_sysnonyms/dictionary_sysnonyms.dart';
import 'package:e_garden/widgets/text_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';
import 'package:e_garden/core/view_model/dictionary_model.dart';


class DictionaryScreen extends StatefulWidget {
  @override
  _DictionaryScreenState createState() => _DictionaryScreenState();
}

class _DictionaryScreenState extends State<DictionaryScreen>
    with TickerProviderStateMixin {
  TextEditingController _search = TextEditingController();
  TabController _controller;
  AnimationController _animationControllerOn;
  AnimationController _animationControllerOff;
  Animation _colorTweenBackgroundOn;
  Animation _colorTweenBackgroundOff;
  Animation _colorTweenForegroundOn;
  Animation _colorTweenForegroundOff;
  int _currentIndex = 0;
  int _prevControllerIndex = 0;
  double _aniValue = 0.0;
  double _prevAniValue = 0.0;
  List _icons = [Icons.star, Icons.whatshot];
  List _textLable = ['MEANINGS', 'SYNONYMS'];
  Color _foregroundOn = Colors.white;
  Color _foregroundOff = Colors.black;
  Color _backgroundOn = AppColors.green;
  Color _backgroundOff = Colors.grey[300];
  ScrollController _scrollController = new ScrollController();
  List _keys = [];
  bool _buttonTap = false;

  @override
  void initState() {
    super.initState();

    for (int index = 0; index < _icons.length; index++) {
      _keys.add(new GlobalKey());
    }
    _controller = TabController(vsync: this, length: _icons.length);
    _controller.animation.addListener(_handleTabAnimation);
    _controller.addListener(_handleTabChange);
    _animationControllerOff =
        AnimationController(vsync: this, duration: Duration(milliseconds: 75));
    _animationControllerOff.value = 1.0;
    _colorTweenBackgroundOff =
        ColorTween(begin: _backgroundOn, end: _backgroundOff)
            .animate(_animationControllerOff);
    _colorTweenForegroundOff =
        ColorTween(begin: _foregroundOn, end: _foregroundOff)
            .animate(_animationControllerOff);

    _animationControllerOn =
        AnimationController(vsync: this, duration: Duration(milliseconds: 150));
    _animationControllerOn.value = 1.0;
    _colorTweenBackgroundOn =
        ColorTween(begin: _backgroundOff, end: _backgroundOn)
            .animate(_animationControllerOn);
    _colorTweenForegroundOn =
        ColorTween(begin: _foregroundOff, end: _foregroundOn)
            .animate(_animationControllerOn);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TextAppBar(
        text: "DICTIONARY",
        height: 100,
      ),
      body: Column(
        children: [
          Center(
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 20, bottom: 20),
              width: SizeConfig.safeBlockHorizontal * 80,
              child: FormBuilderTextField(
                attribute: "Search",
                validators: [FormBuilderValidators.required()],
                style: TextStyle(
                    fontSize: SizeConfig.safeBlockVertical * 2.5,
                    color: AppColors.green),
                controller: _search,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () async {
                      Dictionary _data = await Provider.of<DictionaryModel>(context, listen: false).fetchWord('hello');
                       print(_data.word.toString());
                    },
                  ),
                  contentPadding: EdgeInsets.only(
                      left: SizeConfig.safeBlockHorizontal * 5,
                      right: SizeConfig.safeBlockHorizontal * 3,
                      top: SizeConfig.safeBlockVertical * 2,
                      bottom: SizeConfig.safeBlockVertical * 2),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.green, width: 5),
                      borderRadius: BorderRadius.circular(160)),
                  labelText: "Search",
                  hintText: "Hello",
                  alignLabelWithHint: false,
                  labelStyle: TextStyle(
                      fontSize: SizeConfig.safeBlockVertical * 2.5,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              width: SizeConfig.blockSizeHorizontal * 80,
              height: SizeConfig.blockSizeVertical * 20,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFFF7FAF9), Color(0xFFCEE3D9)]),
                borderRadius: BorderRadius.circular(16),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 6.0),
                    blurRadius: 10.0,
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, left: 15.0),
                        child: Text(
                          'Hello',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'RobotoMono',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '/həˈloʊ/',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                            fontStyle: FontStyle.italic,
                            fontFamily: 'RobotoMono',
                          ),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(top: 8.0, left: 15.0),
                          child: IconButton(
                            icon: Icon(
                              Icons.volume_down_rounded,
                              color: Colors.black,
                              size: 35,
                            ),
                            onPressed: () {},
                          ))
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          'exclamation, noun',
                          style: TextStyle(
                            color: Colors.black38,
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(top: 8.0, left: 15.0),
                          child: IconButton(
                            icon: Icon(
                              Icons.add_box_sharp,
                              color: Colors.black,
                              size: 35,
                            ),
                            onPressed: () {},
                          ))
                    ],
                  )
                ],
              ),
            ),
          ),
          Container(
            // margin: EdgeInsets.only(left: ),
            height: SizeConfig.blockSizeVertical * 7,
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: _icons.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  width: SizeConfig.blockSizeHorizontal * 50,
                  margin: EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 6.0),
                      blurRadius: 10.0,
                    )
                  ]),
                  key: _keys[index],
                  child: ButtonTheme(
                    child: AnimatedBuilder(
                      animation: _colorTweenBackgroundOn,
                      builder: (context, child) => FlatButton(
                          color: _getBackgroundColor(index),
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(0.0)),
                          onPressed: () {
                            setState(() {
                              _buttonTap = true;
                              _controller.animateTo(index);
                              _setCurrentIndex(index);
                              _scrollTo(index);
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                _icons[index],
                                color: _getForegroundColor(index),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  _textLable[index],
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              ),
                            ],
                          )),
                    ),
                  ),
                );
              },
            ),
          ),
          Flexible(
              child: TabBarView(controller: _controller, children: [
            DictionaryMeaningTab(),
            DictionarySysnonymTab(),
          ])),
        ],
      ),
    );
  }

  _handleTabAnimation() {
    _aniValue = _controller.animation.value;
    if (!_buttonTap && ((_aniValue - _prevAniValue).abs() < 1)) {
      _setCurrentIndex(_aniValue.round());
    }
    _prevAniValue = _aniValue;
  }

  _handleTabChange() {
    if (_buttonTap) _setCurrentIndex(_controller.index);
    if ((_controller.index == _prevControllerIndex) ||
        (_controller.index == _aniValue.round())) _buttonTap = false;
    _prevControllerIndex = _controller.index;
  }

  _setCurrentIndex(int index) {
    if (index != _currentIndex) {
      setState(() {
        _currentIndex = index;
      });
      _triggerAnimation();
      _scrollTo(index);
    }
  }

  _triggerAnimation() {
    _animationControllerOn.reset();
    _animationControllerOff.reset();
    _animationControllerOn.forward();
    _animationControllerOff.forward();
  }

  _scrollTo(int index) {
    double screenWidth = MediaQuery.of(context).size.width;
    RenderBox renderBox = _keys[index].currentContext.findRenderObject();
    double size = renderBox.size.width;
    double position = renderBox.localToGlobal(Offset.zero).dx;
    double offset = (position + size / 2) - screenWidth / 2;
    if (offset < 0) {
      renderBox = _keys[0].currentContext.findRenderObject();
      position = renderBox.localToGlobal(Offset.zero).dx;
      if (position > offset) offset = position;
    } else {
      renderBox = _keys[_icons.length - 1].currentContext.findRenderObject();
      position = renderBox.localToGlobal(Offset.zero).dx;
      size = renderBox.size.width;
      if (position + size < screenWidth) screenWidth = position + size;
      if (position + size - offset < screenWidth) {
        offset = position + size - screenWidth;
      }
    }
    _scrollController.animateTo(offset + _scrollController.offset,
        duration: new Duration(milliseconds: 150), curve: Curves.easeInOut);
  }

  _getBackgroundColor(int index) {
    if (index == _currentIndex) {
      return _colorTweenBackgroundOn.value;
    } else if (index == _prevControllerIndex) {
      return _colorTweenBackgroundOff.value;
    } else {
      return _backgroundOff;
    }
  }

  _getForegroundColor(int index) {
    if (index == _currentIndex) {
      return _colorTweenForegroundOn.value;
    } else if (index == _prevControllerIndex) {
      return _colorTweenForegroundOff.value;
    } else {
      return _foregroundOff;
    }
  }
}

import 'package:audioplayers/audioplayers.dart';
import 'package:e_garden/configs/AppConfig.dart';
import 'package:e_garden/core/services/dictionary/dictionary_model.service.dart';
import 'package:e_garden/screens/dictionary/dictionary/dictionary_meaning/dictionary_meaning.dart';
import 'package:e_garden/screens/dictionary/dictionary/dictionary_sysnonyms/dictionary_sysnonyms.dart';
import 'package:e_garden/widgets/text_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class DictionaryScreen extends StatefulWidget {
  @override
  _DictionaryScreenState createState() => _DictionaryScreenState();
  final String newWord;
  DictionaryScreen({this.newWord});
}

class _DictionaryScreenState extends State<DictionaryScreen>
    with TickerProviderStateMixin {
  TextEditingController _search = TextEditingController();
  TabController _controller;
  String fetchWordValue;
  AudioPlayer audioPlayer = AudioPlayer();

  @override
  initState() {
    super.initState();
    fetchWordValue = "Hello";
    _controller = TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    _controller.dispose();
    _search.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DictionaryModel>(builder: (_, cart, __) {
      return SafeArea(
        child: Scaffold(
            appBar: TextAppBar(
              text: "DICTIONARY",
              height: SizeConfig.blockSizeVertical * 8,
              grade: '',
            ),
            body: FutureBuilder(
              future: (widget.newWord == null)
                  ? cart.fetchWord(fetchWordValue)
                  : cart.fetchWord(widget.newWord),
              builder: (context, snapshot) {
                if (snapshot.connectionState != ConnectionState.done) {
                  return Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasData) {
                  return Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        Center(
                          child: Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(top: 20, bottom: 20),
                            width: SizeConfig.safeBlockHorizontal * 80,
                            child: FormBuilderTextField(
                              onFieldSubmitted: (value) {
                                fetchWordValue = _search.text;
                                Provider.of<DictionaryModel>(context,
                                        listen: false)
                                    .changeWord(_search.text);
                              },
                              attribute: "Hello",
                              style: TextStyle(
                                  fontSize: SizeConfig.safeBlockVertical * 2.5,
                                  color: AppColors.green),
                              controller: _search,
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  icon: Icon(Icons.search),
                                  onPressed: () async {
                                    if (_search.text.isNotEmpty) {
                                      fetchWordValue = _search.text;
                                      Provider.of<DictionaryModel>(context,
                                              listen: false)
                                          .changeWord(_search.text);
                                    }
                                  },
                                ),
                                contentPadding: EdgeInsets.only(
                                    left: SizeConfig.safeBlockHorizontal * 5,
                                    right: SizeConfig.safeBlockHorizontal * 3,
                                    top: SizeConfig.safeBlockVertical * 2,
                                    bottom: SizeConfig.safeBlockVertical * 2),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColors.green, width: 5),
                                    borderRadius: BorderRadius.circular(160)),
                                labelText: "Search",
                                hintText:
                                    "Eg: ${cart.dictionary.word.toString()}",
                                alignLabelWithHint: false,
                                labelStyle: TextStyle(
                                    fontSize:
                                        SizeConfig.safeBlockVertical * 2.5,
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
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(0.0, 3.0),
                                  blurRadius: 5.0,
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      width:
                                          SizeConfig.blockSizeHorizontal * 45,
                                      child: FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: Text(
                                          "  " +
                                              cart.dictionary.word[0]
                                                  .toUpperCase() +
                                              cart.dictionary.word.substring(1),
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 40,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'RobotoMono',
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        padding: EdgeInsets.only(bottom: 8.0),
                                        width:
                                            SizeConfig.blockSizeHorizontal * 25,
                                        child: FittedBox(
                                          fit: BoxFit.scaleDown,
                                          child: Text(
                                            cart.dictionary.phonetics[0].text,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20,
                                              fontWeight: FontWeight.normal,
                                              fontStyle: FontStyle.italic,
                                              fontFamily: 'RobotoMono',
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width:
                                          SizeConfig.safeBlockHorizontal * 60,
                                      padding: EdgeInsets.only(left: 15),
                                      child: Text(
                                        cart.type_word,
                                        style: TextStyle(
                                          color: Colors.black38,
                                          fontSize: 20,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: IconButton(
                                        icon: Icon(
                                          Icons.volume_down_rounded,
                                          color: Colors.black,
                                          size: 35,
                                        ),
                                        onPressed: () async {
                                          if (cart.dictionary.phonetics[0]
                                                  .audio ==
                                              null) {
                                            Fluttertoast.showToast(
                                                msg: "Invalid Sound",
                                                toastLength: Toast.LENGTH_SHORT,
                                                backgroundColor:
                                                    Colors.greenAccent,
                                                fontSize: 20);
                                          } else
                                            await audioPlayer.play(cart
                                                .dictionary.phonetics[0].audio);
                                        },
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                              color: const Color(0xFFF1F1F1),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 2.0,
                                ),
                              ]),
                          child: DefaultTabController(
                            length: 2,
                            child: TabBar(
                              unselectedLabelColor: AppColors.darkGreen,
                              indicatorSize: TabBarIndicatorSize.tab,
                              indicatorColor: Colors.teal,
                              indicator: BoxDecoration(color: AppColors.green),
                              tabs: [
                                Tab(
                                  child: Text(
                                    "Meaning",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Tab(
                                  child: Text(
                                    "Synonym",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                              controller: _controller,
                            ),
                          ),
                        ),
                        SizedBox(height: 30,),
                        Expanded(
                          child: TabBarView(controller: _controller, children: [
                            DictionaryMeaningTab(cart.definitions),
                            DictionarySysnonymTab(cart.synonyms),
                          ]),
                        ),
                      ],
                    ),
                  );
                }
                return Center(child: CircularProgressIndicator());
              },
            )),
      );
    });
  }
}

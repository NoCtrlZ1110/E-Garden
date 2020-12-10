import 'package:e_garden/application.dart';
import 'package:e_garden/core/models/user/user.dart';
import 'package:e_garden/core/services/dictionary/dictionary_model.service.dart';
import 'package:e_garden/core/services/translate/translate_model.service.dart';
import 'package:e_garden/screens/dictionary/home_dictionary.dart';
import 'package:e_garden/screens/home.dart';
import 'package:e_garden/screens/home.provider.dart';
import 'package:e_garden/screens/notes/notes.dart';
import 'package:e_garden/screens/signin.dart';
import 'package:e_garden/screens/study/learn/learn.provider.dart';
import 'package:e_garden/screens/study/study.dart';
import 'package:e_garden/screens/study/study.provider.dart';
import 'package:e_garden/screens/user.profile/user.provider.dart';
import 'package:e_garden/utils/api.dart';
import 'package:e_garden/utils/shared_preferences.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'configs/AppConfig.dart';
import 'core/services/note/note_model.service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GestureBinding.instance.resamplingEnabled = true;
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  Application.sharePreference = await SpUtil.getInstance();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => BookModel()),
      ChangeNotifierProvider(create: (_) => DictionaryModel()),
      ChangeNotifierProvider(create: (_) => TranslateModel()),
      ChangeNotifierProvider(create: (_) => LearnModel()),
      ChangeNotifierProvider(create: (_) => NoteModel()),
      ChangeNotifierProvider(create: (_) => HomeModel()),
      ChangeNotifierProvider(create: (_) => UserModel()),
    ],
    child: E_Garden(),
  ));
}

class E_Garden extends StatelessWidget {
  E_Garden() {
    Application.user = User();
    Application.api = API();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Garden',
      theme: ThemeData(
          primarySwatch: Colors.green, visualDensity: VisualDensity.adaptivePlatformDensity, fontFamily: 'QuickSand'),
      initialRoute: '/',
      routes: {
        '/study': (context) => StudyScreen(),
        '/dictionary': (context) => HomeDictionaryScreen(),
        'notes': (context) => CalendarPage(),
        'home': (context) => HomeScreen()
      },
      home: HomePage(title: 'E-Garden'),
      debugShowCheckedModeBanner: false,
      color: AppColors.green,
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SignIn(),
      // body: HomeScreen(),
    );
  }
}

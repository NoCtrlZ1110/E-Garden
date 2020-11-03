import 'package:e_garden/screens/signin.dart';
import 'package:flutter/material.dart';

import 'configs/AppConfig.dart';

void main() {
  runApp(E_Garden());
}

class E_Garden extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Garden',
      theme: ThemeData(
          primarySwatch: Colors.green,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: 'QuickSand'),
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
    );
  }
}

import 'package:e_garden/screens/signin.dart';
import 'package:e_garden/utils/api.dart';
import 'package:e_garden/utils/shared_preferences.dart';
import 'package:e_garden/application.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider_setup.dart' as ProviderSetup;

import 'configs/AppConfig.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Application.api = API();
  Application.sharePreference = await SpUtil.getInstance();
  runApp(MultiProvider(
    providers: ProviderSetup.getProviders(),
    child: E_Garden(),
  ));
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

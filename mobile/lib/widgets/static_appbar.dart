import 'package:e_garden/configs/AppConfig.dart';
import 'package:flutter/material.dart';

AppBar staticAppbar({String title, PreferredSize bottomWidget, List<Widget> action, bool containBackButton = true}) => AppBar(
  leading: containBackButton ? BackButtonWidget() : null,
  automaticallyImplyLeading: false,
  backgroundColor: AppColors.green,
  elevation: 0,
  flexibleSpace: Padding(
    padding: EdgeInsets.only(left: SizeConfig.safeBlockHorizontal * 60),
    child: Image.asset('assets/images/logo.png', fit: BoxFit.cover),
  ),
  title: FittedBox(
    child: Text(
      title,
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
      textAlign: TextAlign.center,
    ),
    fit: BoxFit.fitWidth,
  ),
  centerTitle: true,
  bottom: bottomWidget,
  actions: action,
);

class BackButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: ImageIcon(AssetImage("assets/images/icon/ic_section_back.png")),
      onPressed: () => Navigator.of(context).pop(),
      //color: Colors.white,
    );
  }
}

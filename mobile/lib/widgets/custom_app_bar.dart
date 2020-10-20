import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends PreferredSize {
  final Widget child;
  final double height;
  final Color color;

  CustomAppBar({
    @required this.child,
    this.height = kToolbarHeight,
    this.color,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: preferredSize.height,
      color: color != null ? color : Colors.white,
      alignment: Alignment.center,
      child: child,
    );
  }
}

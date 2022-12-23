import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ReusableContainer extends StatelessWidget {
  double? width;
  double? height;
  EdgeInsetsGeometry? margin;
  Color? color;
  Widget? child;
  EdgeInsetsGeometry? padding;

  ReusableContainer(
      {Key? key,
      this.width,
      this.height,
      this.margin,
      this.color,
      this.child,
      this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      color: color,
      child: child,
    );
  }
}

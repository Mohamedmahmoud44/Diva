import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoundedContainer extends StatelessWidget {
  final Widget child;
  Color color;
  final double? height;
  final double? width;
  Color borderColor;

  RoundedContainer({
    Key? key,
    required this.child,
    required this.color,
    this.borderColor = Colors.transparent,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
      constraints: BoxConstraints.expand(height: 56),
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(
            35.r,
          ),
          border: Border.all(color: borderColor)),
      child: child,
    );
  }
}

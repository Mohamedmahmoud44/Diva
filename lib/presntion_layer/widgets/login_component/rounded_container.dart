import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoundedContainer extends StatelessWidget {
  final Widget child;
   Color color;
  final double? height;
  final double? width;
  RoundedContainer(
      {Key? key,
      required this.child,
      required this.color,
      this.height ,
      this.width ,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(
          35.r,
        ),
      ),
      child: child,
    );
  }
}

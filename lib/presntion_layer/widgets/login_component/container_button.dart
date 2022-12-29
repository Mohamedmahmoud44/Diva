import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoundedContainerButton extends StatelessWidget {
  final Widget child;
  final Color color;
  final double height;
  final double width;

  RoundedContainerButton({
    Key? key,
    required this.child,
    required this.color,
    this.height = 56,
    this.width = 380,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height.h,
      width: width.w,
      decoration: BoxDecoration(
        color: Colors.pink,
        borderRadius: BorderRadius.circular(
          35.r,
        ),
      ),
      child: child,
    );
  }
}

import 'package:flutter/material.dart';

import '../../../size_config.dart';

class RoundedContainer extends StatelessWidget {
  final Widget child;
  final Color color;
  Color? borderColor;

  RoundedContainer(
      {Key? key, required this.child, required this.color, this.borderColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      height: 32.03,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: color,
          border: Border.all(color: borderColor!)),
      child: child,
    );
  }
}

import 'package:diva_final_project/core/app_color.dart';
import 'package:flutter/material.dart';

import '../../../core/app_style.dart';

class ShowAll extends StatelessWidget {
  const ShowAll({Key? key, required this.text, required this.onTap})
      : super(key: key);
  final String text;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: bodyStyle2,
        ),
        TextButton(
            onPressed: onTap,
            child: Text(
              'شاهد الكل ',
              style: bodyStyle4.copyWith(color: AppColor.lightBlackHeader),
            ))
      ],
    );
  }
}

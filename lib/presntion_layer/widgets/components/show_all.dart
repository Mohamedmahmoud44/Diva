import 'package:flutter/material.dart';

import '../../../core/app_color.dart';
import '../../../core/app_style.dart';

class ShowAll extends StatelessWidget {
  final String title;
  final String buttonTitle;

  const ShowAll({Key? key, required this.title, required this.buttonTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: bodyStyle2,
        ),
        TextButton(
          child: Text(
            buttonTitle,
            style: bodyStyle2.copyWith(
                fontSize: 12, color: AppColor.darkGreyColor),
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

import '../../../core/app_style.dart';

class ShowAll extends StatelessWidget {
  final String title;

  const ShowAll({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: bodyStyle2,
        ),
      ],
    );
  }
}

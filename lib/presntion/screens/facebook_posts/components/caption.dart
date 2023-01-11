import 'package:flutter/material.dart';

import '../../../../core/app_color.dart';
import '../../../../core/app_style.dart';
import '../../../../models/model/facebook_data.dart';

class Caption extends StatelessWidget {
  const Caption({
    super.key,
    required this.media,
  });

  final FacebookData media;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          SizedBox(
            height: height * 0.02,
          ),
          Text.rich(
            // textAlign: TextAlign.end,
            maxLines: 3,
            TextSpan(
              style: bodyStyle4.copyWith(
                  color: AppColor.blackColor.withOpacity(0.8)),
              children: [
                TextSpan(
                  text: media.message,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

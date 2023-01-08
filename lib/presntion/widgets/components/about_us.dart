import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_color.dart';
import '../../../core/app_style.dart';
import '../../../models/about_us_model.dart';

class AboutUs extends StatelessWidget {
  final AboutUsModel aboutUsModel;

  const AboutUs({Key? key, required this.aboutUsModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const Icon(
          Icons.brightness_1,
          color: AppColor.pinkColor,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width / 1.29,
          child: Text(
            aboutUsModel.title!,
            style: bodyStyle3.copyWith(
                fontSize: 16.sp, color: AppColor.darkGreyHeader),
          ),
        )
      ],
    );
  }
}

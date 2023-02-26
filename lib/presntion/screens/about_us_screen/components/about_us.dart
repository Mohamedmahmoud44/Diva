import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/app_color.dart';
import '../../../../core/app_style.dart';
import '../../../../models/about_us_model.dart';

class CardView extends StatelessWidget {
  final AboutUsModel aboutUsModel;

  const CardView({Key? key, required this.aboutUsModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          elevation: 5,
          child: Column(
            children: [
              // Image.asset(
              //   aboutUsModel.img!,
              //   fit: BoxFit.cover,
              // ),
              Text(
                aboutUsModel.title!,
                style: bodyStyle2.copyWith(
                    fontSize: 14.sp, color: AppColor.blueColor),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
                child: Text(
                  aboutUsModel.body!,
                  style: bodyStyle.copyWith(color: AppColor.darkGreyHeader),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

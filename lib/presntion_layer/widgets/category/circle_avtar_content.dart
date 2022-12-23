import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_color.dart';
import '../../../core/app_style.dart';
import '../../../models/dress_models.dart';

class CircleAvatarContent extends StatelessWidget {
  final DressModels dressModels;

  const CircleAvatarContent({Key? key, required this.dressModels})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.only(bottom: 10.h, left: 10.w, right: 10.w),
              width: 116.r,
              height: 117.r,
              decoration: BoxDecoration(
                color: const Color(0xFFDDDCDC).withOpacity(0.4),
                borderRadius: BorderRadius.circular(70.r),
              ),
            ),
          ),
          Positioned(
            left: 0.0.w,
            right: 0.0.w,
            top: 0.0.h,
            bottom: 0.0.h,
            child: Image.asset(
              dressModels.imageAssets,
            ),
          ),
          Positioned(
            top: 140.0.h,
            bottom: 0.0.h,
            right: 40.0.w,
            left: 0.0.w,
            child: Text(dressModels.title,
                style: bodyStyle2.copyWith(
                    fontSize: 13.sp, color: AppColor.blueColor)),
          ),
        ],
      ),
    );
  }
}

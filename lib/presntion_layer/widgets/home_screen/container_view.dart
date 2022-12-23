import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_color.dart';
import '../../../core/app_style.dart';

class ContainerView extends StatelessWidget {
  final String image;
  final Color color;

  const ContainerView({Key? key, required this.image, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15.w),
      height: 360.h,
      width: 380.w,
      color: color,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            image,
          ),
          Positioned(
            left: 0.0,
            right: 0.0,
            top: 130.0.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'تخفيضات تصل الي \n 95% ',
                  style: bodyStyle2.copyWith(
                      fontWeight: FontWeight.bold, color: AppColor.whiteColor),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 63.h,
                  width: 198.w,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      side: const BorderSide(color: Colors.white),
                      elevation: 0,
                    ),
                    child: Text(
                      'تصفح الأن ',
                      style: buttonStyle.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 12.sp,
                          letterSpacing: 1),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

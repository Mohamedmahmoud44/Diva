import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/app_color.dart';
import '../../../../core/app_style.dart';
import '../../../../models/model/facebook_data.dart';

class HeartButtonWithLikes extends StatelessWidget {
  const HeartButtonWithLikes({
    Key? key,
    required this.instagramData,
  }) : super(key: key);
  final Summary instagramData;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Positioned(
      bottom: height * 0.02,
      left: width * 0.05,
      child: Row(
        children: [
          Container(
              height: height * 0.04,
              width: width * 0.08,
              decoration: BoxDecoration(
                color: instagramData.canLike!
                    ? AppColor.pinkColor
                    : AppColor.whiteColor,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Icon(
                Icons.favorite,
                color: AppColor.whiteColor,
                size: 18,
              )),
          SizedBox(width: width * 0.03),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 4,
            ),
            decoration: BoxDecoration(
              color: AppColor.whiteColor.withOpacity(0.7),
              borderRadius: BorderRadius.circular(300.r),
            ),
            child: Text(
              "${instagramData.totalCount}",
              style: bodyStyle4.copyWith(
                wordSpacing: 0.30,
                fontSize: 10.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

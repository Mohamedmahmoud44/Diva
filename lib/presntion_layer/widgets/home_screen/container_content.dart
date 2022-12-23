import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_color.dart';
import '../../../core/app_style.dart';
import '../../../core/image_root.dart';
import '../../screens/poduct_details/product_details_screen.dart';
import '../compnnents.dart';

class ContainerContent extends StatelessWidget {
  const ContainerContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            navigateTo(context, ProductDetailsScreen());
          },
          child: SizedBox(
            // width: 180.r,
            height: 210.r,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: Image.asset(
                ImageRoot.homeSliderThree,
                width: 180.r,
                height: 197.3.r,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'فستان فرح تركى',
              style: bodyStyle.copyWith(
                  fontSize: 13.sp, color: AppColor.purpleColor),
            ),
            SizedBox(
              width: 5.w,
            ),
            ...List.generate(
              3,
              (index) => const Icon(
                Icons.star,
                color: Color(0xFFDEC60A),
                size: 15,
              ),
            ),
          ],
        ),
        Text(
          '2500 جنيه ',
          style: TextStyle(
              fontFamily: 'Cairo',
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: const Color(0xFFE40263)),
        )
      ],
    );
  }
}

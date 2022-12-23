import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_color.dart';
import '../../../core/app_style.dart';
import '../text_kota.dart';

class ArticleView extends StatelessWidget {
  final String image;
  final String title;

  const ArticleView({Key? key, required this.image, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          image,
          fit: BoxFit.cover,
          width: 332.r,
          height: 218.r,
        ),
        Text(
          title,
          style: bodyStyle2.copyWith(
              fontWeight: FontWeight.bold, color: AppColor.blueColor),
          textAlign: TextAlign.center,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const TextKota(),
              TextButton(
                onPressed: () {},
                child: Row(
                  children: [
                    const Icon(
                      Icons.comment_rounded,
                      color: Color(0xFF707070),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      'لا توجد تعليقات ',
                      style: bodyStyle2.copyWith(
                          color: AppColor.darkGreyHeader, fontSize: 11),
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_color.dart';
import '../../../core/app_style.dart';
import '../../../models/about_us_model.dart';
import '../../widgets/components/about_us.dart';
import 'components/about_us.dart';

class ABoutUsScreen extends StatelessWidget {
  const ABoutUsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            children: [
              Text(
                'مركز تجميل عرائس وميك اب ',
                style: bodyStyle3,
              ),
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: aboutUsModeList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) => AboutUs(
                  aboutUsModel: aboutUsModeList[index],
                ),
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: 8.h,
                  );
                },
              ),
              SizedBox(
                height: 8.h,
              ),
              Text(
                'ماذا نقدم من خدمات ',
                style: bodyStyle3.copyWith(color: AppColor.pinkColor),
              ),
              ListView.builder(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => CardView(
                        aboutUsModel: aboutUsModeListTwo[index],
                      ),
                  itemCount: aboutUsModeListTwo.length)
            ],
          ),
        ),
      ),
    );
  }
}

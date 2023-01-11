import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/app_color.dart';
import '../../../../core/app_style.dart';
import '../../../../core/image_root.dart';
import '../../../widgets/build_social_media_icon.dart';

class SalesSection extends StatelessWidget {
  const SalesSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Row(
      children: [
        SizedBox(
          width: width * 0.28,
          height: height * 0.14,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              ImageRoot.homeSliderTwo,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'تخفيضات الجمعة البيضاء',
                style: bodyStyle.copyWith(
                    fontSize: 14.sp, color: AppColor.pinkColor),
              ),
              Text(
                'أحصل علي خصومات رائعه من سنتر ديفا \n بمناسبة\nالجمعة البيضاء من شهر نوفمبر ',
                style: bodyStyle.copyWith(
                    fontSize: 11.sp, color: AppColor.greyColor),
                textAlign: TextAlign.right,
              ),
              Expanded(child: BuildSocialMediaIcons()),
            ],
          ),
        ),
      ],
    );
  }
}

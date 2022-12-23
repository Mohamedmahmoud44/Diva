import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/app_color.dart';
import '../../core/app_style.dart';
import '../../models/drawer_model.dart';
import 'compnnents.dart';

class DrawerContent extends StatelessWidget {
  final DrawerModel drawerModel;

  const DrawerContent({Key? key, required this.drawerModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pop(context, drawerModel.widget);
        navigateTo(context, drawerModel.widget);
      },
      child: Stack(alignment: Alignment.centerRight, children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
          width: 380.r,
          height: 50.r,
          decoration: BoxDecoration(
            color: AppColor.lightGreyHeader,
            borderRadius: BorderRadius.circular(50.r),
          ),
          child: Center(
            child: Text(
              drawerModel.title,
              style: bodyStyle.copyWith(color: AppColor.lightBlackColor),
            ),
          ),
        ),
        Container(
            width: 50.w,
            height: 50.h,
            decoration: BoxDecoration(
              color: AppColor.lightBlackHeader,
              borderRadius: BorderRadius.circular(50.r),
            ),
            child: drawerModel.imageIcon),
      ]),
    );
  }
}

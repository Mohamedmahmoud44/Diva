import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/app_color.dart';
import '../../../../core/app_style.dart';
import '../../../../models/drawer_model.dart';
import '../../../widgets/components.dart';

class DrawerContent extends StatelessWidget {
  final DrawerModel drawerModel;

  const DrawerContent({Key? key, required this.drawerModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        Navigator.pop(context, drawerModel.widget);
        navigateTo(context, drawerModel.widget);
      },
      child: Stack(alignment: Alignment.centerRight, children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          width: width * 0.8,
          height: height * 0.07,
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
            margin: EdgeInsets.all(5),
            width: width * 0.14,
            height: height * 0.07,
            decoration: BoxDecoration(
              color: AppColor.lightBlackHeader,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Center(child: drawerModel.imageIcon)),
      ]),
    );
  }
}

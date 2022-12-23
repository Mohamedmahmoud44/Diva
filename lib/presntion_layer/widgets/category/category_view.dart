import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_style.dart';
import '../../../models/category_model.dart';

class CategoryView extends StatelessWidget {
  final CategoryModel categoryModel;

  const CategoryView({Key? key, required this.categoryModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.all(5),
      margin: EdgeInsets.all(2),
      // height: 231.05,
      // width: 200,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5.r),
            child: Image.asset(
              categoryModel.image,
            ),
          ),
          Text(
            categoryModel.title,
            style: bodyStyle4,
          )
        ],
      ),
    );
  }
}

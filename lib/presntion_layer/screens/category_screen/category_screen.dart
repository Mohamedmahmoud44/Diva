import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../models/category_model.dart';
import '../../widgets/category/category_view.dart';
import '../../widgets/home_screen/grid_view.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  String _repeat = 'الأعلي';
  List<String> repeatList = ['الأعلي', 'الأقل'];
  List<int> remindList = [5, 10, 15, 20];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10.h,
            ),
            ViewGrid(
                itemBuilder: (BuildContext context, int index) {
                  return CategoryView(
                    categoryModel: categroyList[index],
                  );
                },
                crossAxisCount: 2,
                itemCount: categroyList.length,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                childAspectRatio: 0.58
                // ScreenUtil().screenWidth / ScreenUtil().screenHeight,
                ),
          ],
        ),
      ),
    );
  }
}

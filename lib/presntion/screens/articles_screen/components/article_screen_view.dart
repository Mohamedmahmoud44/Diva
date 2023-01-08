import 'package:diva_final_project/cubit/home_page/home_page_cubit.dart';
import 'package:diva_final_project/presntion/screens/article_details_screen/article_details_screen.dart';
import 'package:diva_final_project/presntion/widgets/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../models/model/get_article.dart';
import '../../../widgets/text_kota.dart';

class ArticleScreenView extends StatelessWidget {
  final ArticleData articleData;

  const ArticleScreenView({Key? key, required this.articleData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = HomePageCubit.get(context);
    return InkWell(
      onTap: () {
        cubit.GetArticleDetailsPost(id: articleData.id!);
        navigateTo(context, ArticledDetailsScreen());
      },
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 15.h, vertical: 10.w),
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  'https://divanice.com/images?id=${articleData.imageId}',
                  width: 332,
                  height: 218,
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                articleData.name!,
                style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Cairo',
                    height: 2.5),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 12.0.w, vertical: 20.h),
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
                          Text(
                            'لا توجد تعليقات ',
                            style: TextStyle(
                              fontSize: 11.sp,
                              fontFamily: 'Cairo',
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF707070),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

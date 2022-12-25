import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_color.dart';
import '../../../core/app_style.dart';
import '../../../core/image_root.dart';
import '../../../models/article_model.dart';
import '../../home_page_layout.dart';
import '../../widgets/compnnents.dart';

class ArticledDetailsScreen extends StatelessWidget {
  const ArticledDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: ListView(
          children: [
            Column(
              children: [
                Container(
                  width: 428.w,
                  height: 343.h,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(ImageRoot.articlePageScreenOne),
                        fit: BoxFit.cover),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.brightness_1,
                        color: AppColor.pinkColor,
                      ),
                      SizedBox(
                        width: 7.w,
                      ),
                      Expanded(
                        child: SizedBox(
                          width: 356.w,
                          child: Text(
                            'ليله الزفاف هي من الليالي التي ينتظرها الكثير والكثير من  الفتيات فهي ليله العمر لهم والليلة المنتظرة لهم وهو يوم الفرحة بالنسبة لهم لأنه من الايام التي تتمناها وتنتظرها كل فتاه ويجب أن تظهر كل فتاه بشكل مناسب للغاية لان الفتيات يعتبرون هذا اليوم بليلة العمر اي انها لا تأتي في عمرهم غير مرة واحده فحلم البنات من وهم صغار يحلمون بالفستان الابيض فهذا الفستان جميل بلونه الابيض البراق.',
                            style: bodyStyle.copyWith(
                                color: AppColor.lightGreyColor),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.brightness_1,
                        color: AppColor.pinkColor,
                      ),
                      SizedBox(
                        width: 7.w,
                      ),
                      Expanded(
                        child: SizedBox(
                          width: 356.w,
                          child: Text(
                            'ولكن ماذا عن أشكاله الخاصة بالصيف ففي الصيف تتعدد الاشكال وتتعدد موديلات الصيف خصوصا لفساتين الزفاف ومن الصيحات الجديدة انه يتم التنسيق مع العريس ليجعلوا البدلة الخاصة به لتتناسب مع الفستان الخاصة بالفتاة ليظهروا علي افضل واحسن شكل في هذه الليلة المهمة لهم للغاي',
                            style: bodyStyle.copyWith(
                                color: AppColor.lightGreyColor),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  IconButton(
                      onPressed: () {
                        navigateAndFinish(context, HomePageLayoutScreen());
                      },
                      icon: Icon(
                        Icons.home,
                        size: 40,
                        color: AppColor.pinkColor,
                      )),
                  Text(
                    'الرئيسيه',
                    style: bodyStyle2,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  CarouselSlider(
                    items: ArticleModel.articleModelList.map((data) {
                      return Column(children: [
                        Container(
                          height: 200.r,
                          width: double.infinity,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.r),
                            child: Image.asset(
                              data.img,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          data.title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 15.sp),
                        )
                      ]);
                    }).toList(),
                    options: CarouselOptions(
                      height: 250.h,
                      initialPage: 0,
                      viewportFraction: 1.0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayAnimationDuration: Duration(seconds: 1),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

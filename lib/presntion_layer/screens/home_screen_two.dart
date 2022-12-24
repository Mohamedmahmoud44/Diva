import 'package:diva_final_project/presntion_layer/screens/wep_view/component/wep_view_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../core/app_color.dart';
import '../../core/app_style.dart';
import '../../core/image_root.dart';
import '../../models/carsouel_model.dart';
import '../../models/video_model.dart';
import '../../size_config.dart';
import '../widgets/components/show_all.dart';
import '../widgets/home_screen/artcile_view.dart';
import '../widgets/home_screen/carouel_slider.dart';
import 'home_screen/component/video_view_content.dart';

class HomeScreenTwo extends StatelessWidget {
  HomeScreenTwo({Key? key}) : super(key: key);
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 20.0.h),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 201.h,
                  width: 436.68.w,
                  child: Stack(
                    children: [
                      PageView.builder(
                        controller: pageController,
                        itemCount: CarouselModels.carouselList.length,
                        itemBuilder: (context, index) => CarouselSliderView(
                          carouselModels: CarouselModels.carouselList[index],
                        ),
                      ),
                      Positioned(
                        top: 150.h,
                        bottom: 0.h,
                        left: 0.w,
                        right: 140.w,
                        child: SmoothPageIndicator(
                          controller: pageController,
                          count: CarouselModels.carouselList.length,
                          axisDirection: Axis.horizontal,
                          effect: ScrollingDotsEffect(
                              spacing: 20.0,
                              radius: 5.0,
                              dotWidth: 10,
                              dotHeight: 10,
                              paintStyle: PaintingStyle.fill,
                              strokeWidth: 10,
                              dotColor: AppColor.whiteColor,
                              activeDotColor: AppColor.pinkColor),
                        ),
                      )
                    ],
                  ),
                ),
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: Container(
                    margin: const EdgeInsets.all(15),
                    padding: const EdgeInsets.all(10),
                    height: 169.h,
                    width: 380.w,
                    color: const Color(0xFFFEF2F7),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.r),
                          child: Image.asset(
                            ImageRoot.homeSliderTwo,
                            fit: BoxFit.cover,
                            width: 90.w,
                            height: 90.h,
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
                              Expanded(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.price_check,
                                          color: AppColor.purpleColor,
                                        ),
                                        Text(
                                          '3200',
                                          style: bodyStyle4,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.favorite,
                                          color: AppColor.purpleColor,
                                        ),
                                        Text(
                                          '50',
                                          style: bodyStyle4,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.share,
                                          color: AppColor.purpleColor,
                                        ),
                                        Text(
                                          'مشاركة',
                                          style: bodyStyle4,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  height: MediaQuery.of(context).size.height / 2,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xFF4267B2),
                    ),
                  ),
                  child:
                      WepViewContent(url: 'https://m.facebook.com/Divaniicce'),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  height: MediaQuery.of(context).size.height / 2,
                  decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(color: Color(0xFF5B51D8)),
                        bottom: BorderSide(color: Color(0xFFFFDC80)),
                        right: BorderSide(color: Color(0xFFE1306C)),
                        left: BorderSide(color: Color(0xFFC13584))),
                  ),
                  child: WepViewContent(
                      url: 'https://www.instagram.com/divastore.55/'),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: ShowAll(
                    buttonTitle: 'شاهد الكل',
                    title: 'فيديوهات الفناين  ',
                  ),
                ),
                SizedBox(
                  height: 460.h,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => VideoPlayerView(
                      videoModel: videoModelList[index],
                    ),
                    itemCount: videoModelList.length,
                  ),
                ),
                Text(
                  'احدث\n اخبار الموضة والجمال ',
                  style: bodyStyle3.copyWith(fontSize: 24.sp),
                ),
                Container(
                  padding: EdgeInsets.only(top: 20.h),
                  height: 380.h,
                  width: 390.w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      ArticleView(
                        title: 'طريقة اختيار لون فستان الزفاف   مناسب للصيف ',
                        image: ImageRoot.homePageScreenThree,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

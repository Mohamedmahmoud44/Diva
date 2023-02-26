import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/app_style.dart';
import '../../../size_config.dart';
import '../../widgets/build_social_icon.dart';
import '../../widgets/home_screen/show_all.dart';
import 'component/Carousel_page_view.dart';
import 'component/dot_in.dart';
import 'component/facebook_posts.dart';
import 'component/facebook_video_view.dart';
import 'component/sales_section.dart';

class HomePage extends StatelessWidget {
  HomePage({
    Key? key,
  }) : super(key: key);

  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    SizeConfig().init(context);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: height * 0.29,
                width: double.infinity,
                child: Stack(
                  children: [
                    CarouselPageView(pageController: pageController),
                    Positioned(
                      top: height * 0.21,
                      bottom: 0.h,
                      left: 0.w,
                      right: width * 0.38,
                      child: DontIndicator(pageController: pageController),
                    )
                  ],
                ),
              ),
              Directionality(
                textDirection: TextDirection.ltr,
                child: Container(
                  margin: const EdgeInsets.all(15),
                  padding: const EdgeInsets.all(10),
                  height: height * 0.25,
                  width: double.infinity,
                  color: const Color(0xFFFEF2F7),
                  child: SalesSection(),
                ),
              ),
              SizedBox(height: height * 0.02),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: BuildIcon(
                  widget: SvgPicture.asset(
                    'assets/svg/Facebook_Logo_(2015)_light.svg',
                    height: height * 0.03,
                    color: Colors.black,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              FacebookPosts(),
              // Padding(
              //   padding: const EdgeInsets.all(10.0),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.end,
              //     children: [
              //       BuildIcon(
              //         widget: SvgPicture.asset(
              //           'assets/svg/ic_instagram.svg',
              //           height: height * 0.05,
              //           color: Colors.black,
              //           fit: BoxFit.cover,
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // InstagramFeeds(),
              Text(
                'احدث اخبار\n الموضة والجمال ',
                style: bodyStyle3.copyWith(fontSize: 24.sp),
              ),
              // Container(
              //   padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 10.w),
              //   height: 380.h,
              //   width: 390.w,
              //   child: Column(
              //     mainAxisAlignment: MainAxisAlignment.spaceAround,
              //     children: const [
              //       ArticleView(
              //         title: 'طريقة اختيار لون فستان الزفاف   مناسب للصيف ',
              //         image: ImageRoot.homePageScreenThree,
              //       )
              //     ],
              //   ),
              // ),
              // ...List.generate(
              //   1,
              //   (index) => SizedBox(
              //     height: height * 0.60,
              //     child: ArticlesScreen(
              //       isInHomeScreen: true,
              //     ),
              //   ),
              // ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: ShowAll(
                  text: 'فيديوهات الفنانات والمشاهير ',
                  onTap: () {},
                ),
              ),
              // FacebookVideoPosts(),
              FacebookVideoView()
            ],
          ),
        ),
      ),
    );
  }
}


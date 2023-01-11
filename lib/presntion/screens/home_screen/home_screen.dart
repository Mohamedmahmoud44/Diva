import 'package:diva_final_project/cubit/facebook_video/facebook_video_cubit.dart';
import 'package:diva_final_project/presntion/screens/home_screen/component/insta_design.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/app_color.dart';
import '../../../core/app_style.dart';
import '../../../cubit/facebook_video/facebook_video_states.dart';
import '../../../cubit/instagram_posts/instagram_cubit.dart';
import '../../../cubit/instagram_posts/instagram_states.dart';
import '../../../size_config.dart';
import '../../widgets/build_social_icon.dart';
import '../../widgets/components.dart';
import '../../widgets/home_screen/show_all.dart';
import '../instagram_screen/instagram.dart';
import 'component/Carousel_page_view.dart';
import 'component/dot_in.dart';
import 'component/facebook_posts.dart';
import 'component/sales_section.dart';
import 'component/video_view_content.dart';

class HomePage extends StatefulWidget {
  HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController pageController = PageController();

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
            crossAxisAlignment: CrossAxisAlignment.end,
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
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    BuildIcon(
                      widget: SvgPicture.asset(
                        'assets/svg/ic_instagram.svg',
                        height: height * 0.05,
                        color: Colors.black,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
              BlocConsumer<InstagramPostsCubit, InstagramPostsStates>(
                listener: (context, state) {
                  // TODO: implement listener
                },
                builder: (context, state) {
                  var cubit = InstagramPostsCubit.get(context);
                  if (cubit.instData?.businessDiscovery?.media?.data != null)
                    return Container(
                      decoration: BoxDecoration(
                        color: AppColor.whiteColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      width: double.infinity,
                      margin: const EdgeInsets.only(
                          left: 15, right: 15, bottom: 10),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 1, vertical: 15),
                      child: Column(
                        children: [
                          ListView.separated(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            separatorBuilder: (context, index) => Divider(),
                            itemCount: 2,
                            itemBuilder: (context, index) => InstaDesign(
                              media: cubit.instData!.businessDiscovery!.media!
                                  .data![index],
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              navigateTo(context, InstagramPost());
                            },
                            child: Text(
                              'عرض الكل',
                              style: bodyStyle.copyWith(
                                  color: AppColor.whiteColor),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColor.pinkColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  else
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                },
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: ShowAll(
                  text: 'فيديوهات الفنانات والمشاهير ',
                  onTap: () {},
                ),
              ),
              BlocConsumer<FaceBookVideoCubit, FaceBookVideoStates>(
                listener: (context, state) {
                  // TODO: implement listener
                },
                builder: (context, state) {
                  var cubit =
                      FaceBookVideoCubit.get(context).fbVideos?.videos?.data;
                  return SizedBox(
                      height: 460.h,
                      child: cubit != null
                          ? ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) => VideoPlayerView(
                                    data: cubit[index],
                                  ),
                              itemCount: 1)
                          : Center(
                              child: CircularProgressIndicator(),
                            ));
                },
              ),
              Text(
                'احدث اخبار\n الموضة والجمال ',
                style: bodyStyle3.copyWith(fontSize: 24.sp),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 10.w),
                height: 380.h,
                width: 390.w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    // ArticleView(
                    //   title: 'طريقة اختيار لون فستان الزفاف   مناسب للصيف ',
                    //   image: ImageRoot.homePageScreenThree,
                    // )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

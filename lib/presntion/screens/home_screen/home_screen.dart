import 'package:diva_final_project/cubit/facebook_posts/facebook_cubit.dart';
import 'package:diva_final_project/cubit/facebook_video/facebook_video_cubit.dart';
import 'package:diva_final_project/presntion/screens/home_screen/component/insta_design.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/app_color.dart';
import '../../../core/app_style.dart';
import '../../../core/image_root.dart';
import '../../../cubit/facebook_posts/facebook_states.dart';
import '../../../cubit/facebook_video/facebook_video_states.dart';
import '../../../cubit/instagram_posts/instagram_cubit.dart';
import '../../../cubit/instagram_posts/instagram_states.dart';
import '../../../models/carsouel_model.dart';
import '../../../size_config.dart';
import '../../widgets/build_social_icon.dart';
import '../../widgets/build_social_media_icon.dart';
import '../../widgets/components.dart';
import '../../widgets/home_screen/carouel_slider.dart';
import '../../widgets/home_screen/show_all.dart';
import '../facebook_posts/instagram.dart';
import 'component/face_design.dart';
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
    SizeConfig().init(context);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 10),
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
                        effect: const ScrollingDotsEffect(
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
              BuildSocialMediaIcons(),
              SizedBox(height: height * 0.02),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    BuildIcon(
                      widget: SvgPicture.asset(
                        'assets/svg/Facebook_Logo_(2015)_light.svg',
                        height: height * 0.03,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              BlocConsumer<FacebookPostsCubit, FacebookPostsStates>(
                listener: (context, state) {
                  // TODO: implement listener
                },
                builder: (context, state) {
                  var cubit = FacebookPostsCubit.get(context);
                  return Column(
                    children: [
                      if (cubit.fbData?.feed?.data! != null)
                        Container(
                          decoration: BoxDecoration(
                            color: AppColor.whiteColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          width: double.infinity,
                          margin: const EdgeInsets.only(
                              left: 15, right: 15, bottom: 10),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 1, vertical: 15),
                          child: ListView.separated(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            separatorBuilder: (context, index) => Divider(),
                            itemCount: 2,
                            itemBuilder: (context, index) => FaceDesign(
                              media: cubit.fbData!.feed!.data![index],
                            ),
                          ),
                        )
                      else
                        Center(
                          child: CircularProgressIndicator(),
                        ),
                      TextButton(
                        onPressed: () {
                          navigateTo(context, FaceBookPost());
                        },
                        child: Text(
                          'عرض الكل',
                          style: bodyStyle.copyWith(color: Colors.black),
                        ),
                      )
                    ],
                  );
                },
              ),
              SizedBox(
                height: 20.h,
              ),
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
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              BlocConsumer<InstagramPostsCubit, InstagramPostsStates>(
                listener: (context, state) {
                  // TODO: implement listener
                },
                builder: (context, state) {
                  var cubit = InstagramPostsCubit.get(context);
                  return Column(
                    children: [
                      if (cubit.instData?.businessDiscovery?.media?.data !=
                          null)
                        Container(
                          decoration: BoxDecoration(
                            color: AppColor.whiteColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          width: double.infinity,
                          margin: const EdgeInsets.only(
                              left: 15, right: 15, bottom: 10),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 1, vertical: 15),
                          child: ListView.separated(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            separatorBuilder: (context, index) => Divider(),
                            itemCount: 2,
                            itemBuilder: (context, index) => InstaDesign(
                              media: cubit.instData!.businessDiscovery!.media!
                                  .data![index],
                            ),
                          ),
                        )
                      else
                        Center(
                          child: CircularProgressIndicator(),
                        ),
                      TextButton(
                        onPressed: () {
                          navigateTo(context, FaceBookPost());
                        },
                        child: Text(
                          'عرض الكل',
                          style: bodyStyle.copyWith(color: Colors.black),
                        ),
                      )
                    ],
                  );
                },
              ),
              // Container(
              //   height: MediaQuery.of(context).size.height * 0.6,
              //   child: Card(
              //     elevation: 1,
              //     child: Column(
              //       children: [
              //         Row(
              //           children: [
              //             CircleAvatar(
              //               backgroundImage: AssetImage(ImageRoot.divaLogo),
              //               radius: 30,
              //               backgroundColor: Colors.transparent,
              //             ),
              //             SizedBox(
              //               width: 25.w,
              //             ),
              //             Column(
              //               crossAxisAlignment: CrossAxisAlignment.start,
              //               children: [
              //                 Text('أتيلية ديفا_Diva Wedding Dress '),
              //                 TextKota(),
              //               ],
              //             ),
              //           ],
              //         ),
              //         SizedBox(
              //           height: 300.h,
              //           child: BlocConsumer<InstagramPostsCubit,
              //               InstagramPostsStates>(
              //             listener: (context, state) {
              //               // TODO: implement listener
              //             },
              //             builder: (context, state) {
              //               var cubit = InstagramPostsCubit.get(context);
              //               if (cubit
              //                       .instData?.businessDiscovery?.media?.data !=
              //                   null) {
              //                 return ViewGrid(
              //                   physics: NeverScrollableScrollPhysics(),
              //                   shrinkWrap: true,
              //                   itemBuilder: (BuildContext context, index) =>
              //                       InstaView(
              //                     media: cubit.instData!.businessDiscovery!
              //                         .media!.data![index],
              //                   ),
              //                   crossAxisCount: 2,
              //                   itemCount: 2,
              //                   childAspectRatio: 0.40,
              //                 );
              //               }
              //               return Center(
              //                 child: CircularProgressIndicator(),
              //               );
              //             },
              //           ),
              //         ),
              //         Flexible(
              //           child: TextButton(
              //             onPressed: () {
              //               Navigator.of(context).push(
              //                 MaterialPageRoute(
              //                   builder: (context) => InstagramPost(),
              //                 ),
              //               );
              //             },
              //             child: Text(
              //               'عرض الكل ',
              //               style: bodyStyle.copyWith(color: Colors.black),
              //             ),
              //           ),
              //         ),
              //       ],
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
                              itemCount: 2)
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

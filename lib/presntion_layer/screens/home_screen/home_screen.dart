import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/app_color.dart';
import '../../../core/app_style.dart';
import '../../../core/image_root.dart';
import '../../../models/carsouel_model.dart';
import '../../../models/instagram_view.dart';
import '../../../models/video_model.dart';
import '../../../size_config.dart';
import '../../widgets/compnnents.dart';
import '../../widgets/components/show_all.dart';
import '../../widgets/home_screen/artcile_view.dart';
import '../../widgets/home_screen/carouel_slider.dart';
import '../../widgets/home_screen/grid_view.dart';
import '../../widgets/text_kota.dart';
import '../instagram_Screen/home.dart';
import '../post_detail/post_detail_screen.dart';
import 'component/instagram_view.dart';
import 'component/video_view_content.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
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
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: SvgPicture.asset(
                        'assets/svg/facebook-5-logo-svgrepo-com.svg',
                        height: 75.h,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      width: 30,
                      height: 30,
                      color: Colors.transparent,
                      child:
                          SvgPicture.asset('assets/svg/facebook-logo-2019.svg'),
                    ),
                  ],
                ),
              ),
              Card(
                child: Container(
                  margin: EdgeInsets.all(10),
                  height: 700,
                  child: Column(
                    children: [
                      ...List.generate(
                        2,
                        (index) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  radius: 25,
                                  backgroundImage:
                                      AssetImage(ImageRoot.divaLogo),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text('divanice'),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'عروسه ديفا المميزه كل الكلام ده وأكتر كمان هتسمعيه يوم فرحك بعد ما تختاري فستانك والميك اب مع ديفا ',
                                  style: TextStyle(fontSize: 14.sp),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                Container(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15.r),
                                    child: SizedBox(
                                      height: 169.r,
                                      width: double.infinity,
                                      child: Image(
                                        image: NetworkImage(
                                          'https://scontent.fcai19-1.fna.fbcdn.net/v/t39.30808-6/321177608_710504864005101_4234108739131537779_n.jpg?stp=cp6_dst-jpg_s600x600&_nc_cat=100&ccb=1-7&_nc_sid=8bfeb9&_nc_eui2=AeFSUsr0Ho0_MGHSSpiTsnCSWBtqSEXNMr9YG2pIRc0yv7yIVBqRaGXy1BHh42px2EJxsJ87b31EoLyd4wCxLZoq&_nc_ohc=mxLuE49-bQQAX-PNJPh&_nc_ht=scontent.fcai19-1.fna&oh=00_AfCZQ6oZklZ1e3naDwr7HrY-MDXW8EPU9LudaDm49yJh0Q&oe=63A9AC40',
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          navigateTo(context, PostDetails());
                        },
                        child: Text(
                          'عرض الكل',
                          style: bodyStyle.copyWith(color: Colors.black),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: SvgPicture.asset(
                        'assets/svg/ic_instagram.svg',
                        height: 35.h,
                      ),
                    ),
                    SizedBox(width: 8.w,),
                    Container(
                      width: 35.w,
                      height: 35.h,
                      color: Colors.transparent,
                      child:
                      SvgPicture.asset('assets/svg/instagram2.svg'),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.6,
                child: Card(
                  elevation: 4,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage(ImageRoot.divaLogo),
                            radius: 30,
                            backgroundColor: Colors.transparent,
                          ),
                          SizedBox(
                            width: 25.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('أتيلية ديفا_Diva Wedding Dress '),
                              TextKota(),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 300.h,
                        child: ViewGrid(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return InstaView(
                              instagramView: InstagramList[index],
                            );
                          },
                          crossAxisCount: 2,
                          itemCount: 2,
                          childAspectRatio: 0.40,
                        ),
                      ),
                      Flexible(
                        child: TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => HomeScreen()));
                          },
                          child: Text(
                            'عرض الكل ',
                            style: bodyStyle.copyWith(color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: ShowAll(
                  title: 'فيديوهات الفنانات والمشاهير  ',
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
    );
  }
}

import 'dart:convert';

import 'package:diva_final_project/cubit/facebook_posts/facebook_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' show Client;
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/app_color.dart';
import '../../../core/app_style.dart';
import '../../../core/image_root.dart';
import '../../../cubit/facebook_posts/facebook_states.dart';
import '../../../models/carsouel_model.dart';
import '../../../models/fb_data.dart';
import '../../../models/instagram.dart';
import '../../../models/video_model.dart';
import '../../../size_config.dart';
import '../../widgets/compnnents.dart';
import '../../widgets/components/show_all.dart';
import '../../widgets/home_screen/artcile_view.dart';
import '../../widgets/home_screen/carouel_slider.dart';
import '../../widgets/home_screen/grid_view.dart';
import '../../widgets/text_kota.dart';
import '../instagram/instagram.dart';
import '../post_detail/facebook_posts.dart';
import '../post_detail/post_detail_screen.dart';
import 'component/instagram_view.dart';
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
  String fbUrl =
      'https://graph.facebook.com/v15.0/106092821872383?fields=feed%7Bpermalink_url%2Cmessage%2Cfull_picture%7D&access_token=EAAMuZBf9MrtsBAOLGkZAiORfyFv8RXRZCcWUWeDrktPZCwj4RV88EDTJJ8yqCNtxQ5igb2zXEZAYOFw7MsMe45WUmgjkmZAxkmGuXwodUPVFbyXQDTPBhmBjEcwWqahCOlSh8ZB3eiFQH69ubC8ZAP9VSVPpNSaqyHUjpu8dZC5bc0CUvPhHsu2OH';
  List<Data> fbDataList = [];
  Client client = Client();
  String instaUrl =
      'https://graph.facebook.com/v15.0/17841445284244108?fields=media_count%2Cbusiness_discovery.username(magic_mashallah_store)%7Bfollowers_count%2Cmedia%7Bmedia_url%2Cmedia_product_type%2Ccaption%2Cmedia_type%2Cpermalink%2Ctimestamp%7D%7D&access_token=EAAMuZBf9MrtsBAFNUhRCpVv84auk9Sw0rqWHrnTzByAYyBolRptdyVZBfidskmjzzph6620kOdJaACRb7R9aDOQRiPvten7dxyFcZBqq1HSIPNTG6Sgoe5UPysHCzYpyUKVX2A46CLNse3qt7QXbZBsdVBjIWCGTSddosq0yUzEIIZBkTDO5Y';
  List<InstagramData> instaDataList = [];

  @override
  void initState() {
    fetchData();
    fetchInstagramData();
    super.initState();
  }

  Future fetchData() async {
    try {
      final response = await client.get(Uri.parse(fbUrl));
      if (response.statusCode == 200) {
        Iterable i = json.decode(response.body)['feed']['data'];
        setState(() {
          fbDataList = i.map((data) => Data.fromJson(data)).toList();
        });
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future fetchInstagramData() async {
    try {
      final response = await client.get(Uri.parse(instaUrl));
      if (response.statusCode == 200) {
        Iterable i =
            json.decode(response.body)['business_discovery']['media']['data'];
        setState(() {
          instaDataList =
              i.map((data) => InstagramData.fromJson(data)).toList();
        });
      }
    } catch (e) {
      print(e.toString());
    }
  }

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
                      child: Text(
                        'Facebook',
                        style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
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
              BlocConsumer<FacebookPostsCubit, FacebookPostsStates>(
                listener: (context, state) {
                  // TODO: implement listener
                },
                builder: (context, state) {
                  var cubit = FacebookPostsCubit.get(context);
                  return Card(
                    elevation: 10,
                    child: Container(
                      margin: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          cubit.fbData?.feed?.data! != null
                              ? SizedBox(
                                  height: 500,
                                  child: ListView.separated(
                                    physics: NeverScrollableScrollPhysics(),
                                    separatorBuilder: (context, index) =>
                                        SizedBox(
                                      height: 15.h,
                                    ),
                                    itemCount: 1,
                                    itemBuilder: (context, index) =>
                                        FaceBookPosts(
                                      fbData: cubit.fbData!.feed!.data![index],
                                    ),
                                  ),
                                )
                              : Center(
                                  child: CircularProgressIndicator(),
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
                  );
                },
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
                    SizedBox(
                      width: 8.w,
                    ),
                    Container(
                      width: 35.w,
                      height: 35.h,
                      color: Colors.transparent,
                      child: SvgPicture.asset('assets/svg/instagram2.svg'),
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
                          itemBuilder: (BuildContext context, index) =>
                              // ImagePost(media: instaDataList[index]),
                              InstaView(
                            media: instaDataList[index],
                          ),
                          crossAxisCount: 2,
                          itemCount: 2,
                          childAspectRatio: 0.40,
                        ),
                      ),
                      Flexible(
                        child: TextButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => InstagramPost(),
                              ),
                            );
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

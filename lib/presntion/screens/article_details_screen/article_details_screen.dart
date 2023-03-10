import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:diva_final_project/cubit/home_page/home_page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

import '../../../core/app_color.dart';
import '../../../core/app_style.dart';
import '../../../cubit/home_page/home_page_states.dart';
import '../../widgets/components.dart';

class ArticledDetailsScreen extends StatelessWidget {
  const ArticledDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return BlocConsumer<HomePageCubit, HomePageStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = HomePageCubit.get(context).getArticleDetails;
        return Scaffold(
            body: cubit != null
                ? SingleChildScrollView(
                    child: Stack(
                      children: [
                        Container(
                          child: SizedBox(
                            width: width,
                            height: height * 0.5,
                            child: CachedNetworkImage(
                              imageUrl:
                                  'https://divanice.com/images?id=${cubit.imageId!}',
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(0.0, 340.0, 0.0, 0.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            child: Material(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(40.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        20.0, 20.0, 20.0, 20.0),
                                    child: Text(
                                      cubit.name!,
                                      style: const TextStyle(
                                        fontSize: 30.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.bottomLeft,
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 20),
                                    child: HtmlWidget(
                                      cubit.description!,
                                      textStyle: TextStyle(color: Colors.red),
                                    ),
                                  ),
                                  Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: Text(
                                      '???????????? ????????...',
                                      style: titleStyle,
                                    ),
                                  ),
                                  CarouselSlider(
                                    items: cubit.articles!.map((data) {
                                      return Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          InkWell(
                                            child: ColorFiltered(
                                              colorFilter: ColorFilter.mode(
                                                  Colors.black12
                                                      .withOpacity(0.3),
                                                  BlendMode.srcOver),
                                              child: Container(
                                                margin: EdgeInsets.all(10),
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                child: SizedBox(
                                                  height: 300,
                                                  width: double.infinity,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    child: CachedNetworkImage(
                                                      imageUrl:
                                                          'https://divanice.com/images?id=${data.imageId!}',
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            onTap: () {
                                              BlocProvider.of<HomePageCubit>(
                                                      context)
                                                  .GetArticleDetailsPost(
                                                      id: data.id!);
                                              navigateTo(context,
                                                  ArticledDetailsScreen());
                                            },
                                          ),
                                          Text(
                                            data.name!,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                                fontSize: 18.sp),
                                            maxLines: 1,
                                          ),
                                        ],
                                      );
                                    }).toList(),
                                    options: CarouselOptions(
                                      height: 250.h,
                                      initialPage: 0,
                                      viewportFraction: 1.0,
                                      enableInfiniteScroll: true,
                                      reverse: false,
                                      autoPlay: true,
                                      autoPlayInterval: Duration(seconds: 3),
                                      autoPlayAnimationDuration:
                                          Duration(seconds: 1),
                                      autoPlayCurve: Curves.fastOutSlowIn,
                                      scrollDirection: Axis.horizontal,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        AppBar(
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          leading: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.arrow_back_ios,
                              color: AppColor.pinkColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  ));
      },
    );
  }
}

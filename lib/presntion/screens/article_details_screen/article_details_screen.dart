import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:diva_final_project/cubit/home_page/home_page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

import '../../../cubit/home_page/home_page_states.dart';
import '../../widgets/components.dart';

class ArticledDetailsScreen extends StatelessWidget {
  const ArticledDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: BlocConsumer<HomePageCubit, HomePageStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = HomePageCubit.get(context).getArticleDetails;
          return Scaffold(
              body: cubit != null
                  ? SingleChildScrollView(
                      child: Stack(
                        children: [
                          CachedNetworkImage(
                            imageUrl:
                                'https://divanice.com/images?id=${cubit.imageId!}',
                            fit: BoxFit.cover,
                            width: width,
                            height: height * 0.5,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(0.0, 340.0, 0.0, 0.0),
                            child: Container(
                              // height: MediaQuery.of(context).size.height * 3,
                              width: MediaQuery.of(context).size.width,
                              child: Material(
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
                                                        BorderRadius.circular(
                                                            20),
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
                                        // Column(children: [
                                        //   InkWell(
                                        //     onTap: () {
                                        //       BlocProvider.of<HomePageCubit>(
                                        //               context)
                                        //           .GetArticleDetailsPost(
                                        //               id: data.id!);
                                        //       navigateTo(context,
                                        //           ArticledDetailsScreen());
                                        //     },
                                        //     child: Container(
                                        //       height: 200.r,
                                        //       width: double.infinity,
                                        //       child: ClipRRect(
                                        //         borderRadius:
                                        //             BorderRadius.circular(20.r),
                                        //         child: CachedNetworkImage(
                                        //             imageUrl:
                                        //                 'https://divanice.com/images?id=${data.imageId!}'),
                                        //       ),
                                        //     ),
                                        //   ),
                                        //   SizedBox(
                                        //     height: 5.h,
                                        //   ),
                                        //   Text(
                                        //     data.name!,
                                        //     textAlign: TextAlign.center,
                                        //     style: TextStyle(
                                        //         fontWeight: FontWeight.w600,
                                        //         fontSize: 15.sp),
                                        //   )
                                        // ]);
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
                                    //             CarouselSlider(
                                    //               items: cubit.articles!.map((data) {
                                    //                 return Column(children: [
                                    //                   InkWell(
                                    //                     onTap: () {
                                    //                       BlocProvider.of<HomePageCubit>(context)
                                    //                           .GetArticleDetailsPost(id: data.id!);
                                    //                       navigateTo(
                                    //                           context, ArticledDetailsScreen());
                                    //                     },
                                    //                     child: Container(
                                    //                       height: 200.r,
                                    //                       width: double.infinity,
                                    //                       child: ClipRRect(
                                    //                         borderRadius:
                                    //                             BorderRadius.circular(20.r),
                                    //                         child: CachedNetworkImage(
                                    //                             imageUrl:
                                    //                                 'https://divanice.com/images?id=${data.imageId!}'),
                                    //                       ),
                                    //                     ),
                                    //                   ),
                                    //                   SizedBox(
                                    //                     height: 5.h,
                                    //                   ),
                                    //                   Text(
                                    //                     data.name!,
                                    //                     textAlign: TextAlign.center,
                                    //                     style: TextStyle(
                                    //                         fontWeight: FontWeight.w600,
                                    //                         fontSize: 15.sp),
                                    //                   )
                                    //                 ]);
                                    //               }).toList(),
                                    //               options: CarouselOptions(
                                    //                 height: 250.h,
                                    //                 initialPage: 0,
                                    //                 viewportFraction: 1.0,
                                    //                 enableInfiniteScroll: true,
                                    //                 reverse: false,
                                    //                 autoPlay: true,
                                    //                 autoPlayInterval: Duration(seconds: 3),
                                    //                 autoPlayAnimationDuration: Duration(seconds: 1),
                                    //                 autoPlayCurve: Curves.fastOutSlowIn,
                                    //                 scrollDirection: Axis.horizontal,
                                    //               ),
                                    //             ),
                                    //             SizedBox(
                                    //               height: 30,
                                    //             )
                                    //           ],
                                    //         ),
                                    //       ),

                                    // Container(
                                    //   alignment: Alignment.bottomLeft,
                                    //   padding: const EdgeInsets.only(
                                    //       left: 20, right: 20),
                                    //   child: Text(
                                    //     widget.content!,
                                    //     style: const TextStyle(
                                    //       fontSize: 25,
                                    //     ),
                                    //   ),
                                    // ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : Center(
                      child: CircularProgressIndicator(),
                    )
              // ? ListView(
              //     children: [
              //       Container(
              //         margin: EdgeInsets.all(10),
              //         // width: 428.w,
              //         // height: 343.h,
              //         decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(20),
              //         ),
              //         child: SizedBox(
              //           height: 200,
              //           child: ClipRRect(
              //             borderRadius: BorderRadius.circular(20),
              //             child: CachedNetworkImage(
              //                 imageUrl:
              //                     'https://divanice.com/images?id=${cubit.imageId!}',
              //                 fit: BoxFit.cover),
              //           ),
              //         ),
              //       ),
              //       Padding(
              //         padding: EdgeInsets.symmetric(
              //           horizontal: 15,
              //         ),
              //         child: Column(
              //           children: [
              //             // const Icon(
              //             //   Icons.brightness_1,
              //             //   color: AppColor.pinkColor,
              //             // ),
              //             // SizedBox(
              //             //   width: 7.w,
              //             // ),
              //             Padding(
              //               padding: const EdgeInsets.all(20.0),
              //               child: HtmlWidget(
              //                 cubit.description!,
              //                 textStyle: TextStyle(color: Colors.red),
              //               ),
              //             ),
              //             SizedBox(
              //               height: 10.h,
              //             ),
              //             // Row(
              //             //   crossAxisAlignment: CrossAxisAlignment.start,
              //             //   children: [
              //             //     const Icon(
              //             //       Icons.brightness_1,
              //             //       color: AppColor.pinkColor,
              //             //     ),
              //             //     SizedBox(
              //             //       width: 7.w,
              //             //     ),
              //             //     // Expanded(
              //             //     //   child: SizedBox(
              //             //     //     width: 356.w,
              //             //     //     child: Text(
              //             //     //       'ولكن ماذا عن أشكاله الخاصة بالصيف ففي الصيف تتعدد الاشكال وتتعدد موديلات الصيف خصوصا لفساتين الزفاف ومن الصيحات الجديدة انه يتم التنسيق مع العريس ليجعلوا البدلة الخاصة به لتتناسب مع الفستان الخاصة بالفتاة ليظهروا علي افضل واحسن شكل في هذه الليلة المهمة لهم للغاي',
              //             //     //       style:
              //             //     //           bodyStyle.copyWith(color: AppColor.lightGreyColor),
              //             //     //     ),
              //             //     //   ),
              //             //     // )
              //             //   ],
              //             // ),
              //             SizedBox(
              //               height: 10.h,
              //             ),
              //             IconButton(
              //                 onPressed: () {
              //                   navigateAndFinish(
              //                       context, HomePageLayoutScreen());
              //                 },
              //                 icon: Icon(
              //                   Icons.home,
              //                   size: 40,
              //                   color: AppColor.pinkColor,
              //                 )),
              //             Text(
              //               'الرئيسيه',
              //               style: bodyStyle2,
              //             ),
              //             SizedBox(
              //               height: 30,
              //             ),
              //            , CarouselSlider(
              //               items: cubit.articles!.map((data) {
              //                 return Column(children: [
              //                   InkWell(
              //                     onTap: () {
              //                       BlocProvider.of<HomePageCubit>(context)
              //                           .GetArticleDetailsPost(id: data.id!);
              //                       navigateTo(
              //                           context, ArticledDetailsScreen());
              //                     },
              //                     child: Container(
              //                       height: 200.r,
              //                       width: double.infinity,
              //                       child: ClipRRect(
              //                         borderRadius:
              //                             BorderRadius.circular(20.r),
              //                         child: CachedNetworkImage(
              //                             imageUrl:
              //                                 'https://divanice.com/images?id=${data.imageId!}'),
              //                       ),
              //                     ),
              //                   ),
              //                   SizedBox(
              //                     height: 5.h,
              //                   ),
              //                   Text(
              //                     data.name!,
              //                     textAlign: TextAlign.center,
              //                     style: TextStyle(
              //                         fontWeight: FontWeight.w600,
              //                         fontSize: 15.sp),
              //                   )
              //                 ]);
              //               }).toList(),
              //               options: CarouselOptions(
              //                 height: 250.h,
              //                 initialPage: 0,
              //                 viewportFraction: 1.0,
              //                 enableInfiniteScroll: true,
              //                 reverse: false,
              //                 autoPlay: true,
              //                 autoPlayInterval: Duration(seconds: 3),
              //                 autoPlayAnimationDuration: Duration(seconds: 1),
              //                 autoPlayCurve: Curves.fastOutSlowIn,
              //                 scrollDirection: Axis.horizontal,
              //               ),
              //             ),

              //       SizedBox(
              //         height: 30,
              //       )
              //     ],
              //   ),
              // ),
              //     ],
              //   )
              // : Center(
              //     child: CircularProgressIndicator(),
              //   ),
              // cubit != null
              //     ? ArticleDetails(
              //         getArticleDetails: cubit,
              //       )
              //     : Center(
              //         child: CircularProgressIndicator(),
              //       ),
              );
        },
      ),
    );
  }
}

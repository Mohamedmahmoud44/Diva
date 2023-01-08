// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import '../../../../core/app_color.dart';
// import '../../../../core/app_style.dart';
// import '../../../../models/model/get_article_details.dart';
// import '../../../home_page_layout.dart';
// import '../../../widgets/components.dart';
//
// class ArticleDetails extends StatelessWidget {
//   const ArticleDetails({
//     super.key,
//     required this.getArticleDetails,
//   });
//
//   final GetArticleDetails getArticleDetails;
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       children: [
//         Column(
//           children: [
//             Container(
//               width: 428.w,
//               height: 343.h,
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                     image: CachedNetworkImageProvider(
//                         'https://divanice.com/images?id=${getArticleDetails.imageId!}'),
//                     fit: BoxFit.cover),
//               ),
//             ),
//           ],
//         ),
//         Padding(
//           padding: const EdgeInsets.symmetric(
//             horizontal: 15,
//           ),
//           child: Column(
//             children: [
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Icon(
//                     Icons.brightness_1,
//                     color: AppColor.pinkColor,
//                   ),
//                   SizedBox(
//                     width: 7.w,
//                   ),
//                   Expanded(
//                     child: SizedBox(
//                       width: 356.w,
//                       child: Text(
//                         getArticleDetails.description!,
//                         style:
//                             bodyStyle.copyWith(color: AppColor.lightGreyColor),
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//               SizedBox(
//                 height: 10.h,
//               ),
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Icon(
//                     Icons.brightness_1,
//                     color: AppColor.pinkColor,
//                   ),
//                   SizedBox(
//                     width: 7.w,
//                   ),
//                   // Expanded(
//                   //   child: SizedBox(
//                   //     width: 356.w,
//                   //     child: Text(
//                   //       'ولكن ماذا عن أشكاله الخاصة بالصيف ففي الصيف تتعدد الاشكال وتتعدد موديلات الصيف خصوصا لفساتين الزفاف ومن الصيحات الجديدة انه يتم التنسيق مع العريس ليجعلوا البدلة الخاصة به لتتناسب مع الفستان الخاصة بالفتاة ليظهروا علي افضل واحسن شكل في هذه الليلة المهمة لهم للغاي',
//                   //       style:
//                   //           bodyStyle.copyWith(color: AppColor.lightGreyColor),
//                   //     ),
//                   //   ),
//                   // )
//                 ],
//               ),
//               SizedBox(
//                 height: 10.h,
//               ),
//               IconButton(
//                   onPressed: () {
//                     navigateAndFinish(context, HomePageLayoutScreen());
//                   },
//                   icon: Icon(
//                     Icons.home,
//                     size: 40,
//                     color: AppColor.pinkColor,
//                   )),
//               Text(
//                 'الرئيسيه',
//                 style: bodyStyle2,
//               ),
//               SizedBox(
//                 height: 30,
//               ),
//               // CarouselSlider(
//               //   items: getArticleDetails.articles!.map((data) {
//               //     return Column(children: [
//               //       InkWell(
//               //         onTap: () {
//               //           BlocProvider.of<HomePageCubit>(context)
//               //               .GetArticleDetailsPost(id: data.id!);
//               //           navigateTo(context, ArticledDetailsScreen());
//               //         },
//               //         child: Container(
//               //           height: 200.r,
//               //           width: double.infinity,
//               //           child: ClipRRect(
//               //             borderRadius: BorderRadius.circular(20.r),
//               //             child: CachedNetworkImage(
//               //                 imageUrl:
//               //                     'https://divanice.com/images?id=${data.imageId!}'),
//               //           ),
//               //         ),
//               //       ),
//               //       SizedBox(
//               //         height: 5.h,
//               //       ),
//               //       Text(
//               //         data.name!,
//               //         textAlign: TextAlign.center,
//               //         style: TextStyle(
//               //             fontWeight: FontWeight.w600, fontSize: 15.sp),
//               //       )
//               //     ]);
//               //   }).toList(),
//               //   options: CarouselOptions(
//               //     height: 250.h,
//               //     initialPage: 0,
//               //     viewportFraction: 1.0,
//               //     enableInfiniteScroll: true,
//               //     reverse: false,
//               //     autoPlay: true,
//               //     autoPlayInterval: Duration(seconds: 3),
//               //     autoPlayAnimationDuration: Duration(seconds: 1),
//               //     autoPlayCurve: Curves.fastOutSlowIn,
//               //     scrollDirection: Axis.horizontal,
//               //   ),
//               // ),
//               // SizedBox(
//               //   height: 30,
//               // )
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }

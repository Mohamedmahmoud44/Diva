// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:url_launcher/url_launcher.dart';
//
// import '../../../models/model/facebook_data.dart';
//
// class FaceBookPosts extends StatelessWidget {
//   final FacebookData fbData;
//   final Data data;
//
//   FaceBookPosts({Key? key, required this.fbData, required this.data})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     double height = MediaQuery.of(context).size.height;
//     double width = MediaQuery.of(context).size.width;
//     var message = fbData.message != null ? fbData.message : '';
//     return Card(
//       clipBehavior: Clip.antiAliasWithSaveLayer,
//       elevation: 5.0,
//       margin: EdgeInsets.symmetric(
//         horizontal: 8.0,
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 CircleAvatar(
//                   radius: 25.0,
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(20),
//                     child: CachedNetworkImage(imageUrl: data.url!),
//                   ),
//                 ),
//                 SizedBox(
//                   width: 15.0,
//                 ),
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         children: [
//                           Text(
//                             'Divanice',
//                             style: TextStyle(
//                               fontSize: 16,
//                               height: 1.4,
//                             ),
//                           ),
//                           SizedBox(
//                             width: 4.0,
//                           ),
//                         ],
//                       ),
//                       Text(
//                         '${DateFormat('yyy,MMM,dd').format(DateTime.parse(fbData.createdTime!))}',
//                         style: Theme.of(context)
//                             .textTheme
//                             .caption
//                             ?.copyWith(height: 1.4),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(
//                 vertical: 15.0,
//               ),
//               child: Container(
//                 width: double.infinity,
//                 color: Colors.grey[300],
//               ),
//             ),
//             Text(
//               fbData.message != null ? fbData.message! : '',
//               maxLines: 4,
//               overflow: TextOverflow.ellipsis,
//             ),
//             Text(fbData.likes!.summary!.totalCount.toString()),
//             Padding(
//               padding: const EdgeInsets.only(
//                 top: 15.0,
//               ),
//               child: InkWell(
//                 onTap: () async {
//                   if (!await launchUrl(Uri.parse(fbData.permalinkUrl!),
//                       mode: LaunchMode.externalApplication)) {
//                     throw 'Could not launch ${fbData.permalinkUrl!}';
//                   }
//                 },
//                 child: Container(
//                   height: 300.0,
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(
//                       4.0,
//                     ),
//                   ),
//                   child:fbData.fullPicture!=null?CachedNetworkImage(
//                     imageUrl: fbData.fullPicture!,
//                     fit: BoxFit.fitWidth,
//                   ):Container()
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

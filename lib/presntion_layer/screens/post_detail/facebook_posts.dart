import 'package:cached_network_image/cached_network_image.dart';
import 'package:diva_final_project/models/fb_data.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class FaceBookPosts extends StatelessWidget {
  final Data fbData;

  FaceBookPosts({Key? key, required this.fbData}) : super(key: key);

// var message=fbData.message!=null?fbData.message:'';
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 5.0,
      margin: EdgeInsets.symmetric(
        horizontal: 8.0,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 25.0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: CachedNetworkImage(
                      imageUrl:
                          'https://scontent.fcai19-1.fna.fbcdn.net/v/t39.30808-1/270591494_1360471117729243_9039841960358214159_n.jpg?stp=cp0_dst-jpg_p50x50&_nc_cat=109&ccb=1-7&_nc_sid=dbb9e7&_nc_ohc=00Z_-IouerAAX-BqeKk&_nc_ht=scontent.fcai19-1.fna&edm=AJdBtusEAAAA&oh=00_AfDOuayPzpZR6ubXQqKl-E9HkoX7TK-qm4su329F1BPiaA&oe=63B8CBF0',
                    ),
                  ),
                ),
                SizedBox(
                  width: 15.0,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Divanice',
                            style: TextStyle(
                              fontSize: 16,
                              height: 1.4,
                            ),
                          ),
                          SizedBox(
                            width: 4.0,
                          ),
                        ],
                      ),
                      Text(
                        '3/1/2023',
                        style: Theme.of(context)
                            .textTheme
                            .caption
                            ?.copyWith(height: 1.4),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 15.0,
              ),
              child: Container(
                width: double.infinity,
                color: Colors.grey[300],
              ),
            ),
            Text(
              fbData.message != null ? fbData.message! : '',
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 15.0,
              ),
              child: InkWell(
                onTap: () async {
                  if (!await launchUrl(Uri.parse(fbData.permalinkUrl!),
                      mode: LaunchMode.externalApplication)) {
                    throw 'Could not launch ${fbData.permalinkUrl!}';
                  }
                },
                child: Container(
                  height: 300.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      4.0,
                    ),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: fbData.fullPicture!,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );

    //   Column(
    //   crossAxisAlignment: CrossAxisAlignment.start,
    //   children: [
    //     Row(
    //       mainAxisAlignment: MainAxisAlignment.start,
    //       children: [
    //         CircleAvatar(
    //           backgroundColor: Colors.transparent,
    //           radius: 25.r,
    //           child: CachedNetworkImage(
    //             imageUrl:
    //                 'https://scontent.fcai19-1.fna.fbcdn.net/v/t39.30808-1/247703329_106996895115309_5456948272008808798_n.jpg?stp=cp0_dst-jpg_p80x80&_nc_cat=104&ccb=1-7&_nc_sid=dbb9e7&_nc_ohc=6qPpY-92l1IAX90Zih2&_nc_ht=scontent.fcai19-1.fna&edm=AJdBtusEAAAA&oh=00_AfDppo_Q2jO6tqrcFDFSaSHw8yTVBC7hiQeewrfeSKwdPw&oe=63B68264',
    //           ),
    //         ),
    //         SizedBox(
    //           width: 5,
    //         ),
    //         Text('Imac'),
    //       ],
    //     ),
    //     Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         Text(
    //           fbData.message!,
    //           maxLines: 2,
    //           overflow: TextOverflow.ellipsis,
    //         ),
    //         SizedBox(
    //           height: 15.h,
    //         ),
    //         InkWell(
    //           onTap: () async {
    //             if (!await launchUrl(Uri.parse(fbData.permalinkUrl!),
    //                 mode: LaunchMode.externalApplication)) {
    //               throw 'Could not launch ${fbData.permalinkUrl!}';
    //             }
    //           },
    //           child: Container(
    //             height: 200.h,
    //             width: double.infinity,
    //             child: ClipRRect(
    //               borderRadius: BorderRadius.circular(15.r),
    //               child: CachedNetworkImage(
    //                 imageUrl: fbData.fullPicture!,
    //                 fit: BoxFit.cover,
    //                 height: 200,
    //                 width: 200,
    //                 placeholder: (context, url) => CircularProgressIndicator(),
    //                 errorWidget: (context, url, error) => Icon(Icons.error),
    //               ),
    //             ),
    //           ),
    //         )
    //       ],
    //     )
    //   ],
    // );
  }
}

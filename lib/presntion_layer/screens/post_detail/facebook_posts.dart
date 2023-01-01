import 'package:cached_network_image/cached_network_image.dart';
import 'package:diva_final_project/models/fb_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FaceBookPosts extends StatelessWidget {
  final Data fbData;

  const FaceBookPosts({Key? key, required this.fbData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 25.r,
              child: CachedNetworkImage(
                imageUrl:
                    'https://scontent.fcai19-1.fna.fbcdn.net/v/t39.30808-1/247703329_106996895115309_5456948272008808798_n.jpg?stp=cp0_dst-jpg_p80x80&_nc_cat=104&ccb=1-7&_nc_sid=dbb9e7&_nc_ohc=6qPpY-92l1IAX90Zih2&_nc_ht=scontent.fcai19-1.fna&edm=AJdBtusEAAAA&oh=00_AfDppo_Q2jO6tqrcFDFSaSHw8yTVBC7hiQeewrfeSKwdPw&oe=63B68264',
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Text('Imac'),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              fbData.message!,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(
              height: 15.h,
            ),
            Container(
              height: 200.h,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.r),
                child: CachedNetworkImage(
                  imageUrl: fbData.fullPicture!,
                  fit: BoxFit.cover,
                  height: 200,
                  width: 200,
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}

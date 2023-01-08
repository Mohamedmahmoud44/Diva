import 'package:cached_network_image/cached_network_image.dart';
import 'package:diva_final_project/core/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/app_style.dart';
import '../../../../models/model/facebook_data.dart';

class PostGeneralInformation extends StatelessWidget {
  const PostGeneralInformation({Key? key, required this.media})
      : super(key: key);
  final Data media;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Semantics(
      label: "general information about post, authorName,",
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 10,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Semantics(
              label: "author image",
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 20.r,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.r),
                  child: CachedNetworkImage(
                      imageUrl:
                          'https://scontent.fcai19-1.fna.fbcdn.net/v/t39.30808-1/247703329_106996895115309_5456948272008808798_n.jpg?stp=cp0_dst-jpg_p50x50&_nc_cat=104&ccb=1-7&_nc_sid=dbb9e7&_nc_ohc=x-rpsqXNF0EAX_KbLTs&_nc_ht=scontent.fcai19-1.fna&edm=AJdBtusEAAAA&oh=00_AfCrOPUpjfrrql57sacXqKA-ddueghvZ4TThSidnEcrQJQ&oe=63BC7124'),
                ),
              ),
            ),
            SizedBox(width: width * 0.03),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Semantics(
                  label: "author name",
                  child: Text('Imac',
                      style: bodyStyle2.copyWith(
                          fontSize: 12.sp, fontWeight: FontWeight.bold)),
                ),
                Semantics(
                  label: "time of publish differance from now",
                  child: Text(
                    '${DateTime.now().difference(DateTime.parse(media.createdTime!)).inHours} min ago',
                    style: bodyStyle4.copyWith(color: AppColor.darkGreyHeader),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:diva_final_project/core/app_color.dart';
import 'package:diva_final_project/models/model/instagram_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/app_style.dart';

class PostGeneralInformation extends StatelessWidget {
  const PostGeneralInformation({Key? key, required this.media})
      : super(key: key);
  final InstagramData media;

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
                        'https://scontent.fcai19-1.fna.fbcdn.net/v/t51.2885-15/271536885_900239140517020_8856348594862055659_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=86c713&_nc_ohc=c_QCMMkimykAX8fLhXT&_nc_ht=scontent.fcai19-1.fna&edm=AJdBtusEAAAA&oh=00_AfA_2PoSnndt79fGpSFJyCTSR45S--WyQFh0EwoIpL3DSw&oe=63B72AFE',
                  ),
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
                  child: Text('magic_mashallah_store',
                      style: bodyStyle2.copyWith(
                          fontSize: 12.sp, fontWeight: FontWeight.bold)),
                ),
                Semantics(
                  label: "time of publish differance from now",
                  child: Text(
                    '${DateTime.now().difference(DateTime.parse(media.timestamp!)).inHours} min ago',
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

import 'package:cached_network_image/cached_network_image.dart';
import 'package:diva_final_project/core/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../../core/app_style.dart';
import '../../../../models/model/facebook_data.dart';

class PostGeneralInformation extends StatelessWidget {
  const PostGeneralInformation(
      {Key? key, required this.media, required this.data})
      : super(key: key);
  final FacebookData media;
  final Data data;

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
                  child: CachedNetworkImage(imageUrl: data.url!),
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
                  child: Text('Divanice',
                      style: bodyStyle2.copyWith(
                          fontSize: 12.sp, fontWeight: FontWeight.bold)),
                ),
                Semantics(
                  label: "time of publish differance from now",
                  child: Text(
                    '${DateFormat('yyy,MMM,dd').format(
                      DateTime.parse(media.createdTime!),
                    )}',
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

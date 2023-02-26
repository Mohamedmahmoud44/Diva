import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../models/model/instagram_data.dart';

class InstaView extends StatelessWidget {
  final InstagramData media;

  const InstaView({Key? key, required this.media}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(),
      child: Column(
        children: [
          SizedBox(
            height: 5.h,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 300.w,
                child: Text(
                  media.caption!,
                  style: TextStyle(fontSize: 13.sp, color: Colors.black),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(20.r),
                child: SizedBox(
                  width: 280.r,
                  height: 230.r,
                  child: CachedNetworkImage(
                    imageUrl: media.mediaUrl!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

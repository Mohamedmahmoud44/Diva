import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../models/instagram_view.dart';

class InstaView extends StatelessWidget {
  final InstagramView instagramView;

  const InstaView({Key? key, required this.instagramView}) : super(key: key);

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
                  instagramView.title,
                  style: TextStyle(fontSize: 13.sp, color: Colors.black),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(20.r),
                child: SizedBox(
                  width: 280.w,
                  height: 230.r,
                  child: Image.asset(
                    instagramView.urlImage,
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

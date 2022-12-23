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
      decoration: BoxDecoration(
          // border: Border(
          //   top: BorderSide(color: Color(0xFF405DE6)),
          //   right: BorderSide(color: Color(0xFFE1306C)),
          //   bottom: BorderSide(color: Color(0xFFF56040)),
          //   left: BorderSide(color: Color(0xFFC13584)),
          // ),
          ),
      // padding: EdgeInsets.all(5),
      // height: 231.05,
      // width: 200,
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 300,
                child: Text(
                  instagramView.title,
                  style: TextStyle(fontSize: 13, color: Colors.black),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(20.r),
                child: Image.asset(
                  instagramView.urlImage,
                  width: 250,
                  height: 250,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

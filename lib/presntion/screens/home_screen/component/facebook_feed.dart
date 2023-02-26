import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../../core/app_color.dart';
import '../../../../core/app_style.dart';
import '../../../../models/model/facebook_data.dart';

class FacebookFeed extends StatelessWidget {
  const FacebookFeed({Key? key, required this.data, required this.fbData})
      : super(key: key);
  final FacebookData data;
  final FBData fbData;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.all(9),
      margin: EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    height: 50.r,
                    width: 50.r,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: CachedNetworkImageProvider(
                            fbData.picture!.data!.url!,
                          ),
                          fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(
                    width: width * 0.03,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        fbData.name!,
                        style: bodyStyle4.copyWith(
                            color: AppColor.blackColor, wordSpacing: 0.5),
                      ),
                      Text(
                        '${DateFormat('yyyy/MMMM/dd').format(DateTime.parse(data.createdTime!))}',
                        style: buttonStyle.copyWith(
                            fontSize: 12.sp, color: AppColor.blackHeader),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
          SizedBox(
            height: height * 0.02,
          ),
          Text(
            data.message != null ? data.message! : '',
            maxLines: 3,
            style: bodyStyle4.copyWith(
                color: AppColor.blackColor, wordSpacing: 0.5),
          ),
          SizedBox(
            height: height * 0.02,
          ),
          data.fullPicture != null
              ? Container(
                  height: height * 0.32,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: CachedNetworkImageProvider(data.fullPicture!),
                        fit: BoxFit.cover),
                  ),
                )
              : Container(),
          SizedBox(
            height: height * 0.02,
          ),
          Row(
            children: [
              Container(
                  height: height * 0.04,
                  width: width * 0.08,
                  decoration: BoxDecoration(
                    color: data.likes!.summary!.totalCount != null
                        ? AppColor.pinkColor
                        : AppColor.whiteColor,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Icon(
                    Icons.favorite,
                    color: AppColor.whiteColor,
                    size: 18,
                  )),
              SizedBox(width: width * 0.02),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: AppColor.greyColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(300),
                ),
                child: Text(
                  "${data.likes!.summary!.totalCount!}",
                  style: bodyStyle4.copyWith(
                    wordSpacing: 0.30,
                    fontSize: 11.sp,
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

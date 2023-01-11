import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/app_color.dart';
import '../../../../core/app_style.dart';
import '../../../../models/model/instagram_data.dart';

class InstaDesign extends StatelessWidget {
  const InstaDesign({Key? key, required this.media}) : super(key: key);
  final InstagramData media;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
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
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: CachedNetworkImageProvider(
                                'https://scontent.fcai19-1.fna.fbcdn.net/v/t39.30808-1/247703329_106996895115309_5456948272008808798_n.jpg?stp=cp0_dst-jpg_p50x50&_nc_cat=104&ccb=1-7&_nc_sid=dbb9e7&_nc_ohc=x-rpsqXNF0EAX_KbLTs&_nc_ht=scontent.fcai19-1.fna&edm=AJdBtusEAAAA&oh=00_AfCrOPUpjfrrql57sacXqKA-ddueghvZ4TThSidnEcrQJQ&oe=63BC7124'),
                            fit: BoxFit.cover)),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Imac',
                        style: TextStyle(
                            color: Colors.grey[900],
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Text(
                        '${DateTime.now().difference(DateTime.parse(media.timestamp!)).inDays} D',
                        style: TextStyle(fontSize: 15, color: Colors.grey),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            media.caption!,
            maxLines: 3,
            style: TextStyle(
                fontSize: 15,
                color: Colors.grey[800],
                height: 1.5,
                letterSpacing: .7),
          ),
          SizedBox(
            height: 20,
          ),
          media.mediaUrl != ''
              ? Container(
                  height: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: CachedNetworkImageProvider(media.mediaUrl!),
                          fit: BoxFit.cover)),
                )
              : Container(),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Container(
                  height: height * 0.04,
                  width: width * 0.08,
                  decoration: BoxDecoration(
                    color: media.likeCount != null
                        ? AppColor.pinkColor
                        : AppColor.whiteColor,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Icon(
                    Icons.favorite,
                    color: AppColor.whiteColor,
                    size: 18,
                  )),
              SizedBox(width: width * 0.03),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: AppColor.whiteColor.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(300.r),
                ),
                child: Text(
                  "${media.likeCount!}",
                  style: bodyStyle4.copyWith(
                    wordSpacing: 0.30,
                    fontSize: 10.sp,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

Widget makeLove() {
  return Container(
    width: 25,
    height: 25,
    decoration: BoxDecoration(
        color: Colors.red,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white)),
    child: Center(
      child: Icon(Icons.favorite, size: 12, color: Colors.white),
    ),
  );
}

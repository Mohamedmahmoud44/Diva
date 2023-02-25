import 'package:cached_network_image/cached_network_image.dart';
import 'package:fijkplayer/fijkplayer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../models/model/facebook_videos.dart';

class VideoScreen extends StatefulWidget {
  final VideoData data;

  VideoScreen({required this.data});

  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  final FijkPlayer player = FijkPlayer();

  _VideoScreenState();

  @override
  void initState() {
    super.initState();
    player.setDataSource(widget.data.source!,
        autoPlay: false, showCover: false);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 5.h, horizontal: 4.w),
        height: 200.h,
        color: Colors.black,
        alignment: Alignment.center,
        child: FijkView(
            player: player,
            fit: FijkFit.cover,
            cover: CachedNetworkImageProvider(
                "https://scontent.fcai19-1.fna.fbcdn.net/v/t39.30808-6/316314415_699480794869085_606000904176074146_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=e3f864&_nc_ohc=33iAb6VFfVQAX_gxMfB&_nc_ht=scontent.fcai19-1.fna&edm=AJdBtusEAAAA&oh=00_AfCWkWiPymUlB79gz0LnnKk3JW9WvORYSa4Fgi2b4RS7nQ&oe=63D24E12")));
  }

  @override
  void dispose() {
    super.dispose();
    player.release();
  }
}

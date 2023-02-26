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
        autoPlay: false, showCover: true);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.h, horizontal: 4.w),
      height: 200.h,
      color: Colors.black,
      alignment: Alignment.center,
      child: FijkView(player: player, fit: FijkFit.cover),
    );
  }

  @override
  void dispose() {
    super.dispose();
    player.release();
  }
}

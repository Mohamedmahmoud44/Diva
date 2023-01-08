import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';

import '../../../../models/model/facebook_videos.dart';

class VideoPlayerView extends StatefulWidget {
  const VideoPlayerView({Key? key, required this.data}) : super(key: key);
  final VideoData data;
  // final VideoModel videoModel;

  @override
  State<VideoPlayerView> createState() => _VideoPlayerViewState();
}

class _VideoPlayerViewState extends State<VideoPlayerView> {
  late VideoPlayerController controller;
  ChewieController? chewieController;

  Future<void> loadVideo() async {
    controller = VideoPlayerController.network(widget.data.source!);
    await Future.wait([controller.initialize()]);
    controller.initialize().then((_) => setState(() {}));
    chewieController = ChewieController(
        videoPlayerController: controller,
        autoInitialize: true,
        looping: false,
        autoPlay: false);
  }

  @override
  void initState() {
    loadVideo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 3.w),
          height: 200.h,
          color: Colors.black,
          child: chewieController != null &&
                  chewieController!.videoPlayerController.value.isInitialized
              ? Chewie(controller: chewieController!)
              : Center(
                  child: Text('Waiting'),
                )),
    );
  }
}

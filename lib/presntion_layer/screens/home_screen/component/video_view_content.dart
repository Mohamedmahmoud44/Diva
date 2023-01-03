import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';

import '../../../../models/video_model.dart';

class VideoPlayerView extends StatefulWidget {
  const VideoPlayerView({Key? key, required this.videoModel}) : super(key: key);
  final VideoModel videoModel;

  @override
  State<VideoPlayerView> createState() => _VideoPlayerViewState();
}

class _VideoPlayerViewState extends State<VideoPlayerView> {
  late VideoPlayerController controller;
  ChewieController? chewieController;

  Future<void> loadVideo() async {
    controller = VideoPlayerController.asset(widget.videoModel.url);
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
  void dispose() {
    controller.dispose();
    chewieController?.dispose();
    super.dispose();
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

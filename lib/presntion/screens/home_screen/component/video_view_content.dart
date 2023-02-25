import 'package:chewie/chewie.dart';
import 'package:diva_final_project/cubit/facebook_video/facebook_video_cubit.dart';
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
    controller = VideoPlayerController.network(widget.data.source!)
      ..initialize().then((value) {
        setState(() {
          controller.play();
        });
      });
    ;
    await Future.wait([controller.initialize()]);
    if (mounted) {
      setState(() {
        controller.initialize();
      });
    }
    controller.addListener(() {
      setState(() {});
    });

    // .then((_) => setState(() {}));
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
    chewieController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = FaceBookVideoCubit.get(context);
    return SafeArea(
      child: chewieController != null &&
              chewieController!.videoPlayerController.value.isInitialized
          ? Container(
              margin: EdgeInsets.symmetric(vertical: 5.h, horizontal: 3.w),
              height: 200.h,
              color: Colors.black,
              child: Chewie(
                controller: chewieController!,
              ),
            )
          : const Center(
              child: Text('Wait'),
            ),
    );
    // return SafeArea(
    //   child: BlocProvider(
    //     create: (context) => FaceBookVideoCubit()
    //       ..getAllFaceBookVideos()
    //       ..loadVideo(url: widget.data.source!),
    //     child: BlocConsumer<FaceBookVideoCubit, FaceBookVideoStates>(
    //       listener: (context, state) {
    //         // TODO: implement listener
    //       },
    //       builder: (context, state) {
    //         return SizedBox(
    //             height: 460.h,
    //             child: cubit != null
    //                 ? ListView.builder(
    //                     shrinkWrap: true,
    //                     physics: NeverScrollableScrollPhysics(),
    //                     itemBuilder: (context, index) => Container(
    //                         margin: EdgeInsets.symmetric(
    //                             vertical: 10.h, horizontal: 3.w),
    //                         height: 200.h,
    //                         color: Colors.black,
    //                         child: cubit.chewieController != null &&
    //                                 cubit
    //                                     .chewieController!
    //                                     .videoPlayerController
    //                                     .value
    //                                     .isInitialized
    //                             ? Chewie(controller: cubit.chewieController!)
    //                             : Center(
    //                                 child: Text('Waiting'),
    //                               )),
    //                     itemCount: 2)
    //                 : Center(
    //                     child: CircularProgressIndicator(),
    //                   ));
    //       },
    //     ),
    //   ),
    // );
  }
}

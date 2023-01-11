import 'dart:convert';
import 'dart:developer';

import 'package:chewie/chewie.dart';
import 'package:diva_final_project/cubit/facebook_video/facebook_video_states.dart';
import 'package:diva_final_project/network/remote/meta_developer_dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';

import '../../models/model/facebook_videos.dart';

class FaceBookVideoCubit extends Cubit<FaceBookVideoStates> {
  FaceBookVideoCubit() : super(FaceBookVideoInitial());
  ApiServices apiServices = ApiServices();
  FBVideos? fbVideos;

  static FaceBookVideoCubit get(context) => BlocProvider.of(context);

  void getAllFaceBookVideos() {
    emit(FaceBookVideoLoadingState());
    apiServices
        .getData(
            url:
                '272272949882404?fields=videos%7Bsource%7D&access_token=EAAVoclWUZCSABAOkPWiUNZC30rSJVnoZAIk40igEYNt1PK6pVZBRwMDo5569XnsJ8oL47ZCMIXWGeRQg3ZBTmgd4GRYSOsMmtQElvqIUcpOIlw7tI4rfSoPovPkpE0JZAtZCE2vJ9JxOrLi7Igd8zaMpTltSL68T31g6uYCv2mdQsgu86ZCjpNZALZCQkCKUm50QypEKy5xdKsHQAZDZD')
        .then((value) {
      fbVideos = FBVideos.fromJson(JsonDecoder().convert(value.data));
      // log(value.data.toString());
      emit(FaceBookVideoSuccessState());
    }).catchError((error) {
      log(error.toString());
      emit(FaceBookVideoFailState(error: error.toString()));
    });
  }

//===========================================================================================================================================
  late VideoPlayerController controller;
  ChewieController? chewieController;

  Future<void> loadVideo({required String url}) async {
    emit(VideoLoadingState());
    try {
      controller = VideoPlayerController.network(url);
      await Future.wait([controller.initialize()]);
      controller.initialize().then((_) => emit(VideoSuccessState()));
      chewieController = ChewieController(
          videoPlayerController: controller,
          autoInitialize: true,
          looping: false,
          autoPlay: false);
    } catch (e) {
      log(e.toString());
      emit(VideoFailState(error: e.toString()));
    }
  }
}

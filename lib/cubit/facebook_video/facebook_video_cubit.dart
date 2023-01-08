import 'dart:convert';
import 'dart:developer';

import 'package:diva_final_project/cubit/facebook_video/facebook_video_states.dart';
import 'package:diva_final_project/network/remote/meta_developer_dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                '106092821872383?fields=videos%7Bsource%7D&access_token=EAAMuZBf9MrtsBAM1QW3sTFCZCJwW2AJHHmTlEjZBOgZBHu8z1HVsD7QEJuPT03yWEaxZA4dlLW79y2mmPJXRhEZAluvospDmn7sSh6mZAv90MuHOSLk63cXPjStJgWXaXpQjyRAUiTcvSv67XxZCRleUjZAylRhbdjwsqFrhoPjQlMBaJiyTUYIaM')
        .then((value) {
      fbVideos = FBVideos.fromJson(JsonDecoder().convert(value.data));
      log(value.data.toString());
      emit(FaceBookVideoSuccessState());
    }).catchError((error) {
      log(error.toString());
      emit(FaceBookVideoFailState(error: error.toString()));
    });
  }
}

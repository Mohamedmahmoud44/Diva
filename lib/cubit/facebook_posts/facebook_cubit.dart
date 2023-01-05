import 'dart:convert';
import 'dart:developer';

import 'package:diva_final_project/models/fb_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../dio.dart';
import 'facebook_states.dart';

class FacebookPostsCubit extends Cubit<FacebookPostsStates> {
  FacebookPostsCubit() : super(FaceBookPostsInitial());
  ApiServices apiServices = ApiServices();
  FBData? fbData;

  static FacebookPostsCubit get(context) => BlocProvider.of(context);

  void getAllPosts() {
    emit(FacebookPostsLoading());
    try {
      apiServices
          .getData(
              url:
              '272272949882404?fields=feed%7Bmessage%2Cfull_picture%2Ccreated_time%2Cpermalink_url%2Clikes.summary(true)%7D&access_token=EAAVoclWUZCSABAIMxKyiMXI4jpsW2IoC6WlWAQ4mUA2LR0fkzr3vmSLyGFBrBPzTrBLZB0QyI9NwxRQYYlWZBrV1xy6N6SQdl8CYSQAHzEz38SX4gcGMiSv3243NjDCbswf0Bx40HNLZATUfqPhZBZAKqoA6crHSa9sHj5NSpl6W6YeBFTWtKWHOYxmcPrhogZD')
          .then((value) {
        fbData = FBData.fromJson(JsonDecoder().convert(value.data));
        print(value.data.toString());
        emit(FacebookPostsSuccess());
      });
    } catch (e) {
      log(e.toString());
      emit(FacebookPostsFail(e.toString()));
    }
  }
}

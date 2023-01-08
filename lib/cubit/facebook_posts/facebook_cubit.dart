import 'dart:convert';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/model/facebook_data.dart';
import '../../network/remote/meta_developer_dio.dart';
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
                  '106092821872383?fields=feed%7Bmessage%2Cfull_picture%2Ccreated_time%2Cpermalink_url%2Clikes.summary(true)%2Ccomments.summary(true)%7D&access_token=EAAMuZBf9MrtsBAMhRwAIp4s13w5nud8f4Q0GmPfC9f9ZBwSuqc5A8Lwnlm2ADtwQDMH6KiQVC0yPJHowAj4AcaThvLz6JxKijAnWM26ZCHUeaZA9A5ej7UckrjrdmsGLFBr3TgCRGHjrLW7T0Pwyep5gWPpUJHX2tJK8K7V3NzvMHBRIuO2t')
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

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
                  '272272949882404?fields=picture%2Cname%2Cfeed%7Bmessage%2Cfull_picture%2Ccreated_time%2Cpermalink_url%2Clikes.summary(true)%7D&access_token=EAAVoclWUZCSABAJlRxaKaRkCJ7usXtfRBREpaYhOOwbvcmPDrR3YV5ia4ibRndQOdKdUeB134H3dO0ZCx55rvwZBCNQ7fBvH1AkCZCT01rkNUZAVBqZAnFhZCitX7ZAt8ihqcVJZA2EiSxPbTVTZAAHKxO1h8FQ2UxNu9u1sZAbVYk56ZC0U8NVGKIu1SxU1Hp8bXOefZBiEbkSYQJAZDZD')
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

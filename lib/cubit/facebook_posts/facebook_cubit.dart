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
                  '272272949882404?fields=feed%7Bpermalink_url%2Cmessage%2Cfull_picture%2Ccreated_time%7D&access_token=EAAVoclWUZCSABAGNTqVBF2RdwVPJKFk9sNFYsXwrxx9SOykbBQGg3BIeXtQNg3nOmFLn3MB8OavKPjuWawUJiyOlFceidJreT24DviNNTLTGR3zQt9ndY80VaaZBFNLxudd1MPlDpoal6gPevAuWCrFp7MXlhH2ChuZBDM0eKyoAgKyW0JOZADwtgCZBjZCtzJjohGkuv29gZDZD')
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

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
                  'id%2Cname%2Cposts%7Bfull_picture%2Cmessage%7D&access_token=EAAMuZBf9MrtsBAOLGkZAiORfyFv8RXRZCcWUWeDrktPZCwj4RV88EDTJJ8yqCNtxQ5igb2zXEZAYOFw7MsMe45WUmgjkmZAxkmGuXwodUPVFbyXQDTPBhmBjEcwWqahCOlSh8ZB3eiFQH69ubC8ZAP9VSVPpNSaqyHUjpu8dZC5bc0CUvPhHsu2OH')
          .then((value) async {
        assert(value != null);
        fbData = FBData.fromJson(JsonDecoder().convert(value.data));
        // print(value.data.toString());
        emit(FacebookPostsSuccess());
      });
    } catch (e) {
      log(e.toString());
      emit(FacebookPostsFail(e.toString()));
    }
  }
}

import 'dart:convert';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/model/instagram_data.dart';
import '../../network/remote/meta_developer_dio.dart';
import 'instagram_states.dart';

class InstagramPostsCubit extends Cubit<InstagramPostsStates> {
  InstagramPostsCubit() : super(InstagramPostsInitial());
  ApiServices apiServices = ApiServices();
  InstagramPosts? instData;

  static InstagramPostsCubit get(context) => BlocProvider.of(context);

  void getAllPosts() {
    emit(InstagramPostsLoading());
    try {
      apiServices
          .getData(
              url:
                  '17841445284244108?fields=business_discovery.username(magic_mashallah_store)%7Bmedia%7Bmedia_url%2Cmedia_product_type%2Ccaption%2Cmedia_type%2Cpermalink%2Ctimestamp%2Clike_count%2Ccomments_count%2Cchildren%7Bmedia_url%7D%2Cvideo_url%7D%7D&access_token=EAAMuZBf9MrtsBAFNUhRCpVv84auk9Sw0rqWHrnTzByAYyBolRptdyVZBfidskmjzzph6620kOdJaACRb7R9aDOQRiPvten7dxyFcZBqq1HSIPNTG6Sgoe5UPysHCzYpyUKVX2A46CLNse3qt7QXbZBsdVBjIWCGTSddosq0yUzEIIZBkTDO5Y')
          .then((value) {
        instData = InstagramPosts.fromJson(JsonDecoder().convert(value.data));
        print(value.data.toString());
        emit(InstagramPostsSuccess());
      });
    } catch (e) {
      log(e.toString());
      emit(InstagramPostsFail(e.toString()));
    }
  }
}

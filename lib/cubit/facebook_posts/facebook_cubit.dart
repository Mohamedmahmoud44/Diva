import 'dart:developer';

import 'package:diva_final_project/models/fb_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../dio.dart';
import 'facebook_states.dart';

class HomePagCubit extends Cubit<HomePagStates> {
  HomePagCubit() : super(HomePageInitial());
  ApiServices apiServices = ApiServices();
  FBData? fbData;
  static HomePagCubit get(context) => BlocProvider.of(context);

  void getCategoryData() {
    emit(ProductDetailsLoading());
    try {
      apiServices.getData().then((value) {
        // fbData = FBData.fromJson(value.data);
        // print(value.data.toString());
        emit(ProductDetailsSuccess());
      });
    } catch (e) {
      log(e.toString());
      emit(ProductDetailsFail(e.toString()));
    }
  }
}

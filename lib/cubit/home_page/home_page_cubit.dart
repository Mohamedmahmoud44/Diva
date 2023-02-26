import 'dart:developer';

import 'package:diva_final_project/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../core/icon_root.dart';
import '../../models/model/get_article.dart';
import '../../models/model/get_article_details.dart';
import '../../presntion/screens/about_us_screen/about_us_screen.dart';
import '../../presntion/screens/articles_screen/atricels_screen.dart';
import '../../presntion/screens/home_screen/home_screen.dart';
import 'home_page_states.dart';

class HomePageCubit extends Cubit<HomePageStates> {
  HomePageCubit() : super(HomePageInitial());

  static HomePageCubit get(context) => BlocProvider.of(context);

  //==============================================================================================================
  //ChangeScreenByBottomNavigationBar
  int currentIndex = 1;
  List<String> titleList = [
    'من نحن ',
    'الرئيسية',
    'المقالات',
  ];
  List<Widget> bottomNavScreens = [
    const ABoutUsScreen(),
    HomePage(),
    const ArticlesScreen(),
  ];
  List<BottomNavigationBarItem> bottomNavBarItems = [
    const BottomNavigationBarItem(
        icon: ImageIcon(
          AssetImage(IconRoot.infoIcon),
        ),
        label: 'من نحن '),
    const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'الرئيسيه'),
    BottomNavigationBarItem(
        icon: FaIcon(FontAwesomeIcons.fileSignature), label: 'المقالات'),
  ];

  void changeBottomNavBarIndex(int index) {
    try {
      currentIndex = index;
      emit(BottomNavBarSuccessState());
    } catch (e) {
      emit(BottomNavBarFailState(e.toString()));
    }
  }

//============================================================================================
  GetArticle? getArticle;

  void getArticleData() {
    emit(GetArticleLoadingState());
    DioHelper.getData(url: 'tables.article/getArticlesPojo').then((value) {
      getArticle = GetArticle.fromJson(value.data);
      log(value.data.toString());
      emit(GetArticleSuccessState());
    }).catchError((error) {
      log(error.toString());
      emit(GetArticleFailState(error.toString()));
    });
  }

//============================================================================================
  GetArticleDetails? getArticleDetails;

  void GetArticleDetailsPost({required int id}) {
    emit(GetArticleDetailsLoadingState());
    DioHelper.postData(
        url: 'tables.article/getArticleDetails',
        data: {'id': id}).then((value) {
      getArticleDetails = GetArticleDetails.fromJson(value.data);
      log(' the value is====${value.data.toString()}');
      emit(GetArticleDetailsSuccessState());
    }).catchError((error) {
      log(error.toString());
      emit(GetArticleDetailsFailState(error.toString()));
    });
  }
}

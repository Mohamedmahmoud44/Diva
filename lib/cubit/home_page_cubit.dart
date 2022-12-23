import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/icon_root.dart';
import '../presntion_layer/screens/articles_screen/atricels_screen.dart';
import '../presntion_layer/screens/category_screen/category_screen.dart';
import '../presntion_layer/screens/home_screen/home_screen.dart';
import 'home_page_states.dart';

class HomePageCubit extends Cubit<HomePageStates> {
  HomePageCubit() : super(HomePageInitial());

  static HomePageCubit get(context) => BlocProvider.of(context);

  //==============================================================================================================
  //ChangeScreenByBottomNavigationBar
  int currentIndex = 1;
  List<String> titleList = [
    'الفساتين',
    'الرئيسية',
    'المقالات',
  ];
  List<Widget> bottomNavScreens = [
    const CategoryScreen(),
    HomePage(),
    const ArticlesScreen(),
  ];
  List<BottomNavigationBarItem> bottomNavBarItems = [
    const BottomNavigationBarItem(
        icon: ImageIcon(
          AssetImage(IconRoot.dressIcon),
        ),
        label: 'المنتجات'),
    const BottomNavigationBarItem(
        icon: ImageIcon(
          AssetImage(IconRoot.homeIcon),
        ),
        label: 'الرئيسيه'),
    const BottomNavigationBarItem(
        icon: ImageIcon(
          AssetImage(IconRoot.articleIcon),
        ),
        label: 'المقالات'),
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
}

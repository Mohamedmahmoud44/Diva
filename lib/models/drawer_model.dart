import 'package:flutter/material.dart';

import '../core/app_color.dart';
import '../core/icon_root.dart';
import '../presntion_layer/screens/about_us_screen/about_us_screen.dart';
import '../presntion_layer/screens/communicate/communicate_screen.dart';
import '../presntion_layer/screens/login/login_screen.dart';
import '../presntion_layer/screens/notification_screen/notification_screen.dart';

class DrawerModel {
  final String title;
  final ImageIcon imageIcon;
  final Widget widget;

  DrawerModel(
      {required this.widget, required this.title, required this.imageIcon});
}

List<DrawerModel> drawerList = [
  DrawerModel(
    widget: const NotificationScreen(),
    title: 'الاشعارات',
    imageIcon: const ImageIcon(
      AssetImage(IconRoot.notificationIcon),
      color: AppColor.lightBlackColor,
    ),
  ),
  DrawerModel(
    widget: const CommunicateScreen(),
    title: 'اتصل بنا',
    imageIcon: const ImageIcon(
      AssetImage(IconRoot.phoneIcon),
      color: AppColor.lightBlackColor,
    ),
  ),
  DrawerModel(
    widget: const ABoutUsScreen(),
    title: 'من نحن ',
    imageIcon: const ImageIcon(
      AssetImage(IconRoot.infoIcon),
      color: AppColor.lightBlackColor,
    ),
  ),
  DrawerModel(
    widget: LoginScreen(),
    title: 'تسجيل خروج',
    imageIcon: const ImageIcon(
      AssetImage(IconRoot.logOutIcon),
      color: AppColor.lightBlackColor,
    ),
  ),
];

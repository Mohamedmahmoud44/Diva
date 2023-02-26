import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../core/app_color.dart';
import '../presntion/screens/communication_screen/communicate_screen.dart';
import '../presntion/screens/login_screen/login_screen.dart';
import '../presntion/screens/notification_screen/notification_screen.dart';

class DrawerModel {
  final String title;
  Widget imageIcon;
  final Widget widget;

  DrawerModel(
      {required this.widget, required this.title, required this.imageIcon});
}

List<DrawerModel> drawerList = [
  DrawerModel(
      widget: const NotificationScreen(),
      title: 'الاشعارات',
      imageIcon: Icon(
        Icons.notifications,
        color: AppColor.lightBlackColor,
      )),
  DrawerModel(
      widget: const CommunicateScreen(),
      title: 'اتصل بنا',
      imageIcon: Icon(
        FontAwesomeIcons.phoneFlip,
        size: 19,
        color: AppColor.lightBlackColor,
      )),
  DrawerModel(
      widget: LoginScreen(),
      title: 'تسجيل خروج',
      imageIcon: FaIcon(
        FontAwesomeIcons.arrowLeft,
        size: 16,
        color: AppColor.lightBlackColor,
      )),
];

import 'package:flutter/material.dart';

import '../../core/app_style.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final AppBar appBar;
  Widget? leadingIcon;
  List<Widget>? actions;

  CustomAppBar(
      {Key? key,
      this.leadingIcon,
      required this.title,
      required this.appBar,
      this.actions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        centerTitle: true,
        title: Text(title, style: titleStyle),
        backgroundColor: Colors.white,
        leading: leadingIcon,
        actions: actions);
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}

import 'package:flutter/material.dart';

import '../../../../core/app_color.dart';
import '../../../../core/app_style.dart';
import 'rounded_container.dart';

class RoundedTextFormFiled extends StatelessWidget {
  RoundedTextFormFiled(
      {Key? key,
      required this.controller,
      required this.type,
      this.validate,
      required this.hintText,
      this.prefix,
      this.suffixIcon,
      this.suffixPressed})
      : super(key: key);
  final TextEditingController controller;
  final TextInputType type;
  final validate;
  final String hintText;
  final IconData? prefix;
  final IconData? suffixIcon;
  final Function()? suffixPressed;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return RoundedContainer(
      height: height * 0.08,
      color: AppColor.whiteHeader,
      child: TextFormField(
        validator: validate,
        controller: controller,
        keyboardType: type,
        decoration: InputDecoration(
          isDense: true,
          hintText: hintText,
          hintStyle: bodyStyle4.copyWith(color: AppColor.greyHeaderColor),
          suffixIcon: IconButton(
            icon: Icon(suffixIcon),
            onPressed: suffixPressed,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}

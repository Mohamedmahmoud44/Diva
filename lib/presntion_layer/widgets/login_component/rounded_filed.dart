import 'package:flutter/material.dart';

import '../../../core/app_color.dart';
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
  IconData? prefix;

  // IconData? suffix;
  IconData? suffixIcon;
  Function()? suffixPressed;

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      color: AppColor.whiteHeader,
      child: TextFormField(
        validator: validate,
        controller: controller,
        keyboardType: type,
        decoration: InputDecoration(
          isDense: true,
          hintText: hintText,
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

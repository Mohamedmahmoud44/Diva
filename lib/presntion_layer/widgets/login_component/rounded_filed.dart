import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      color: const Color(0xFff2F2F2),
      child: TextFormField(
        validator: validate,
        controller: controller,
        keyboardType: type,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              35.r,
            ),
          ),
          // hintStyle: ,
          hintText: hintText,
          // suffix: Icon(
          //   suffix,
          //   color: Colors.red,
          // ),
          suffixIcon: IconButton(
            icon: Icon(suffixIcon),
            onPressed: suffixPressed,
          ),
        ),
      ),
    );
  }
}

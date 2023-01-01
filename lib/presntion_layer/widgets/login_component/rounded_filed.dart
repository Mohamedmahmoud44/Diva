import 'package:flutter/material.dart';

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
      height: 70,
      color: Colors.white,
      // color: const Color(0xFff2F2F2),
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
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                color: Colors.green,
              ),
            ),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(50))),
      ),
    );
  }
}

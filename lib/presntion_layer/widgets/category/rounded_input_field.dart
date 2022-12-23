import 'package:flutter/material.dart';

import 'rounded_contained.dart';

class InputField extends StatelessWidget {
  TextEditingController? controller;
  final String hintText;
  final String text;
  final Widget? widget;
  Icon? icon;
  TextInputType? textInputType;
  Icon? prefixxIcon;
  final bool obscureText;

  InputField(
      {Key? key,
      this.controller,
      required this.hintText,
      required this.text,
      this.widget,
      this.icon,
      this.prefixxIcon,
      this.obscureText = false,
      this.textInputType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: const TextStyle(fontSize: 14),
        ),
        const SizedBox(
          width: 5,
        ),
        Expanded(
          child: RoundedContainer(
            borderColor: Colors.grey.withOpacity(0.8),
            color: Colors.transparent,
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    obscureText: obscureText,
                    keyboardType: textInputType,
                    style: const TextStyle(
                        fontSize: 14,
                        fontFamily: 'Cairo',
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1),
                    readOnly: widget != null ? true : false,
                    controller: controller,
                    decoration: InputDecoration(
                      prefixIcon: prefixxIcon,
                      suffixIcon: icon,
                      hintText: hintText,
                      hintStyle: const TextStyle(
                          fontSize: 10,
                          fontFamily: 'Cairo',
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 2),
                      border: InputBorder.none,
                      focusedBorder: const UnderlineInputBorder(
                          borderSide:
                              BorderSide(width: 0, color: Colors.white)),
                    ),
                  ),
                ),
                widget ?? Container(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

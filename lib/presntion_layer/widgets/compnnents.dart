import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

void navigateAndFinish(
  context,
  widget,
) =>
    Navigator.pushAndRemoveUntil(
        context, MaterialPageRoute(builder: (context) => widget), (route) {
      return false;
    });

Widget defaultTextFormField({
  required TextEditingController controller,
  required TextInputType type,
  required validate,
  required String label,
  required IconData prefix,
  IconData? suffix,
  Function? suffixPressed,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      validator: validate,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              35.r,
            ),
          ),
          hintText: label,
          prefixIcon: Icon(prefix)),
    );

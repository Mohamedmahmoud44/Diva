import 'package:flutter/material.dart';

import '../../../../core/app_color.dart';
import '../../../../core/app_style.dart';
import 'rounded_container.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.imageIcon,
    this.isSkippedButton = false,
  }) : super(key: key);
  final Function() onPressed;
  final String text;
  final Widget? imageIcon;
  final bool isSkippedButton;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return RoundedContainer(
      height: height * 0.08,
      borderColor: isSkippedButton ? AppColor.pinkColor : Colors.transparent,
      color: isSkippedButton ? Colors.transparent : AppColor.pinkColor,
      child: TextButton(
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              imageIcon != null ? Expanded(child: imageIcon!) : Center(),
              Text(
                text,
                style: bodyStyle.copyWith(
                    color: isSkippedButton
                        ? AppColor.pinkColor
                        : AppColor.whiteColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

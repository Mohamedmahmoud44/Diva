import 'package:diva_final_project/presntion_layer/widgets/login_component/rounded_container.dart';
import 'package:flutter/material.dart';

import '../../../core/app_style.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.imageIcon = '',
  }) : super(key: key);
  final Function() onPressed;
  final String text;
  String imageIcon;

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      color: Colors.pink,
      child: TextButton(
        onPressed: onPressed,
        child: Row(
          children: [
            Text(
              text,
              style: bodyStyle,
            ),
            ImageIcon(AssetImage(imageIcon ?? ''))
          ],
        ),
      ),
    );
  }
}

import 'package:diva_final_project/presntion_layer/widgets/login_component/rounded_container.dart';
import 'package:flutter/material.dart';

import '../../../core/app_style.dart';
import 'container_button.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    Key? key,
    required this.onPressed,
     required this.text,
  }) : super(key: key);
  final Function() onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return RoundedContainerButton(
        color: Colors.pink,
        child: TextButton(
          onPressed: onPressed,
          child: Text(
            text,
            style: bodyStyle,
          ),
        ));
  }
}

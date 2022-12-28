import 'package:diva_final_project/presntion_layer/widgets/login_component/rounded_container.dart';
import 'package:flutter/material.dart';

class CutomButton extends StatelessWidget {
  const CutomButton({Key? key, required this.onPressed, required this.text})
      : super(key: key);
  final Function() onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
        color: Colors.pink,
        child: TextButton(
          onPressed: onPressed,
          child: Text(text),
        ));
  }
}

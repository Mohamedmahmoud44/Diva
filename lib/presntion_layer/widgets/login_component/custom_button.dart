import 'package:diva_final_project/presntion_layer/widgets/login_component/rounded_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_style.dart';

class CustomButton extends StatelessWidget {
  //update
  CustomButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.imageIcon,
  }) : super(key: key);
  final Function() onPressed;
  final String text;
  String? imageIcon;

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      color: Colors.pink,
      child: TextButton(
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              imageIcon != null
                  ? ImageIcon(
                      AssetImage(imageIcon!),
                    )
                  : Center(),
              SizedBox(width: 10.w,),
              Text(
                text,
                style: bodyStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

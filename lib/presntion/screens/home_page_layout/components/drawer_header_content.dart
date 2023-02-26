import 'package:flutter/material.dart';

import '../../../../core/app_color.dart';
import '../../../../core/app_style.dart';
import '../../../../core/image_root.dart';

class DrawerHeaderContent extends StatelessWidget {
  const DrawerHeaderContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          height: height * 0.10,
          width: width * 0.20,
          decoration: BoxDecoration(
            border: Border.all(color: AppColor.pinkColor.withOpacity(0.2)),
            borderRadius: BorderRadius.circular(70),
          ),
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            child: Image.asset(
              ImageRoot.divaLogo,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Text(
          'Diva center',
          style: bodyStyle2.copyWith(
            color: AppColor.purpleColor,
          ),
        ),
      ],
    );
  }
}

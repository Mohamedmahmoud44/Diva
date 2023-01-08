import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'build_social_icon.dart';

class BuildSocialMediaIcons extends StatelessWidget {
  const BuildSocialMediaIcons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        BuildIcon(
          widget: SvgPicture.asset('assets/svg/icons8-facebook.svg'),
          url: 'fb://page/272272949882404',
        ),
        BuildIcon(
          widget: SvgPicture.asset('assets/svg/icons8-facebook-messenger.svg'),
          url: 'http://m.me/Divaniicce',
        ),
        BuildIcon(
          widget: SvgPicture.asset('assets/svg/icons8-instagram.svg'),
          url: 'https://www.instagram.com/divanice.eg/',
        ),
      ],
    );
  }
}

import 'package:flutter/painting.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'app_color.dart';

class SvgIconsHelper {
  static SvgPicture fromSvg({
    required String svgPath,
    Color? color,
    required String semanticLabel,
    double? size,
  }) {
    return SvgPicture.asset(
      svgPath,
      color: color ?? AppColor.blackColor,
      semanticsLabel: semanticLabel,
      height: size,
      width: size,
      fit: BoxFit.none,
    );
  }
}

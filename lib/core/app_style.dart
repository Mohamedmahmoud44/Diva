import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_color.dart';

TextStyle get titleStyle {
  return GoogleFonts.cairo(
    fontSize: 22.sp,
    fontWeight: FontWeight.normal,
    color: AppColor.lightBlackColor,
  );
}

TextStyle get bodyStyle {
  return GoogleFonts.cairo(
    fontSize: 16.sp,
    fontWeight: FontWeight.normal,
    color: AppColor.whiteColor,
  );
}

TextStyle get buttonStyle {
  return GoogleFonts.cairo(
    fontSize: 8.sp,
    fontWeight: FontWeight.normal,
    color: AppColor.whiteColor,
  );
}

TextStyle get bodyStyle2 {
  return GoogleFonts.cairo(
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
    color: AppColor.blackColor,
  );
}

TextStyle get bodyStyle3 {
  return GoogleFonts.cairo(
    fontSize: 20.sp,
    fontWeight: FontWeight.normal,
    color: AppColor.pinkColor,
  );
}

TextStyle get bodyStyle4 {
  return GoogleFonts.cairo(
    fontSize: 13.sp,
    fontWeight: FontWeight.normal,
    color: AppColor.purpleColor,
  );
}

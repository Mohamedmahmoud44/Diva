import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/image_root.dart';
import '../on_boarding/on_boarding_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EasySplashScreen(
        backgroundColor: Colors.white,
        logoWidth: 380.r / 1.62,
        logo: Image.asset(
          ImageRoot.divaLogo,
          fit: BoxFit.cover,
        ),
        durationInSeconds: 4,
        navigator: const OnBoardingScreen(),
      ),
    );
  }
}

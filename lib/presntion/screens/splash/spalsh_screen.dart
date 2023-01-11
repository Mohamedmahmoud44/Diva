import 'package:diva_final_project/core/image_root.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        height: 800,
        width: 200,
        child: Image(
          image: AssetImage(ImageRoot.homeSliderOne),
        ),
      ),
    );
  }
}

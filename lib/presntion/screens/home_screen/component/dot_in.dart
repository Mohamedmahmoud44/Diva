import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/app_color.dart';
import '../../../../models/carsouel_model.dart';

class DontIndicator extends StatelessWidget {
  const DontIndicator({
    super.key,
    required this.pageController,
  });

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: pageController,
      count: CarouselModels.carouselList.length,
      axisDirection: Axis.horizontal,
      effect: const ScrollingDotsEffect(
          spacing: 20.0,
          radius: 5.0,
          dotWidth: 10,
          dotHeight: 10,
          paintStyle: PaintingStyle.fill,
          strokeWidth: 10,
          dotColor: AppColor.whiteColor,
          activeDotColor: AppColor.pinkColor),
    );
  }
}

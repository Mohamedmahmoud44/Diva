import 'package:flutter/material.dart';

import '../../../../models/carsouel_model.dart';
import '../../../widgets/home_screen/carouel_slider.dart';

class CarouselPageView extends StatelessWidget {
  const CarouselPageView({
    super.key,
    required this.pageController,
  });

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      itemCount: CarouselModels.carouselList.length,
      itemBuilder: (context, index) => CarouselSliderView(
        carouselModels: CarouselModels.carouselList[index],
      ),
    );
  }
}

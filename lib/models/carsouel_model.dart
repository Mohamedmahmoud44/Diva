import '../core/image_root.dart';

class CarouselModels {
  final String image;
  CarouselModels(this.image);
  static List<CarouselModels> carouselList = [
    CarouselModels(ImageRoot.homeSliderOne),
    CarouselModels(ImageRoot.homeSliderTwo),
    CarouselModels(ImageRoot.homeSliderThree),
  ];
}

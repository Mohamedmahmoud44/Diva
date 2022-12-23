import '../core/image_root.dart';

class DressModels {
  final String imageAssets;
  final String title;

  DressModels(this.imageAssets, this.title);

  static List<DressModels> dressList = [
    DressModels(ImageRoot.dressPageScreenOne, 'ميك اب'),
    DressModels(ImageRoot.dressPageScreenTwo, 'فساتين افراح'),
    DressModels(ImageRoot.dressPageScreenThree, 'فساتين خطوبة'),
  ];
}

import '../core/image_root.dart';

class CategoryModel {
  final String image;
  final String title;

  CategoryModel({required this.image, required this.title});
}

List<CategoryModel> categroyList = [
  CategoryModel(image: ImageRoot.dressImageOne, title: 'فستان فرح تركي '),
  CategoryModel(image: ImageRoot.dressImageSix, title: 'فستان فرح تركي '),
  CategoryModel(image: ImageRoot.dressImageOne, title: 'فستان فرح تركي '),
  CategoryModel(image: ImageRoot.dressImageThree, title: 'فستان فرح تركي '),
  CategoryModel(image: ImageRoot.dressImageFour, title: 'فستان فرح تركي '),
  CategoryModel(image: ImageRoot.dressImageFive, title: 'فستان فرح تركي '),
];

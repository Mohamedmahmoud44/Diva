import '../core/image_root.dart';

class CartModel {
  final String img;
  final String prodName;
  final int prodPrice;

  CartModel(
      {required this.img, required this.prodName, required this.prodPrice});
}

List<CartModel> cartModelList = [
  CartModel(
      img: ImageRoot.homePageScreenThree,
      prodName: 'فستان فرح ',
      prodPrice: 2500),
  CartModel(
      img: ImageRoot.articlePageScreenThree,
      prodName: 'فستان فرح ',
      prodPrice: 2500),
  CartModel(
      img: ImageRoot.articlePageScreenTwo,
      prodName: 'فستان فرح ',
      prodPrice: 2500),
];

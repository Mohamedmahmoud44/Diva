import '../core/image_root.dart';

class ArticleModel {
  final String img;
  final String title;

  ArticleModel(this.img, this.title);

  static List<ArticleModel> articleModelList = [
    ArticleModel(ImageRoot.articlePageScreenOne,
        'طريقة اختيار لون فستان الزفاف \n  مناسب للصيف '),
    ArticleModel(ImageRoot.articlePageScreenTwo,
        'طريقة اختيار لون فستان الزفاف \n  مناسب للصيف '),
    ArticleModel(ImageRoot.articlePageScreenThree,
        'طريقة اختيار لون فستان الزفاف \n  مناسب للصيف ')
  ];
}

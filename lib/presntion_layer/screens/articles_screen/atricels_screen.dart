import 'package:flutter/material.dart';

import '../../../models/article_model.dart';
import 'components/article_screen_view.dart';

class ArticlesScreen extends StatelessWidget {
  const ArticlesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: ListView.builder(
          itemCount: ArticleModel.articleModelList.length,
          itemBuilder: (context, index) => ArticleScreenView(
            articleModel: ArticleModel.articleModelList[index],
          ),
        ),
      ),
    );
  }
}

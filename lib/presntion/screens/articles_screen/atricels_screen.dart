import 'package:diva_final_project/cubit/home_page/home_page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubit/home_page/home_page_states.dart';
import 'components/article_screen_view.dart';

class ArticlesScreen extends StatelessWidget {
  const ArticlesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomePageCubit, HomePageStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = HomePageCubit.get(context).getArticle;
        return SafeArea(
          child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: cubit?.data?.length != null
                  ? ListView.builder(
                      itemCount: cubit!.data?.length,
                      itemBuilder: (context, index) => ArticleScreenView(
                        articleData: cubit.data![index],
                      ),
                    )
                  : Center(
                      child: CircularProgressIndicator(),
                    )),
        );
      },
    );
  }
}

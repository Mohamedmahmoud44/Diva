import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../models/posts.dart';
import 'widgets/IURPostCard.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.grey,
        ),
        title: SvgPicture.asset(
          'assets/svg/ic_instagram.svg',
          color: Colors.black,
          height: 50,
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...List.generate(
                  postsSamples.length,
                  (index) => IURPostCard(
                    key: Key("postCard$index"),
                    post: postsSamples[index],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

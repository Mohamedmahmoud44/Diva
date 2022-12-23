import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controllers/home_screen_controller/home_screen_controller.dart';
import '../../../../core/app_color.dart';
import '../../../../models/IURPost_model.dart';
import 'ImagesNumerations.dart';
import 'ImagesPageView.dart';
import 'IndicatorDots.dart';
import 'PostGeneralInformation.dart';

class IURPostCard extends StatelessWidget {
  IURPostCard({
    Key? key,
    required this.post,
  }) : super(key: key);

  final HomeScreenController homeScreenController =
      Get.put(HomeScreenController());
  final IURPostModel post;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.whiteColor,
        borderRadius: BorderRadius.circular(20),
      ),
      width: double.infinity,
      margin: const EdgeInsets.only(left: 15, right: 15, bottom: 20),
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PostGeneralInformation(
            post: post,
          ),
          SizedBox(
            width: double.infinity,
            child: Stack(
              alignment: Alignment.center,
              children: [
                ImagesPageView(
                  homeScreenController: homeScreenController,
                  post: post,
                ),
                IndicatorDots(
                  post: post,
                  homeScreenController: homeScreenController,
                ),
                ImagesNumerations(
                  homeScreenController: homeScreenController,
                  post: post,
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 7.5,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text.rich(
                  TextSpan(
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                          fontWeight: FontWeight.w400,
                          color: AppColor.blackColor.withOpacity(1),
                          fontSize: 14,
                        ),
                    children: [
                      TextSpan(
                        text: "${post.title} ",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: post.description,
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10 * 2 - (5 / 2),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

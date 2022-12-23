import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../../controllers/home_screen_controller/home_screen_controller.dart';
import '../../../../core/app_color.dart';
import '../../../../models/IURPost_model.dart';

class ImagesNumerations extends StatelessWidget {
  const ImagesNumerations({
    Key? key,
    required this.homeScreenController,
    required this.post,
  }) : super(key: key);

  final HomeScreenController homeScreenController;
  final IURPostModel post;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 25,
      right: 20,
      child: Obx(
        () => Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 4,
          ),
          decoration: BoxDecoration(
            color: AppColor.blackColor.withOpacity(.25),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            "${(post.iURPostModelPageController == homeScreenController.pageControllerExample1 ? homeScreenController.scrollPosition1.value!.round() : homeScreenController.scrollPosition2.value!.round()) + 1} / ${post.imgPaths.length}",
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: AppColor.whiteColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                ),
          ),
        ),
      ),
    );
  }
}

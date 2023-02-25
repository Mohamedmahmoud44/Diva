import 'package:flutter/material.dart';

import '../../../../core/app_color.dart';
import '../../../../models/model/facebook_data.dart';
import 'caption.dart';
import 'heart_button_with_likes.dart';
import 'images_page_view.dart';
import 'post_general_information.dart';

class ImagePost extends StatelessWidget {
  const ImagePost({
    Key? key,
    required this.media, required this.data,
  }) : super(key: key);
  final FacebookData media;
  final Data data;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColor.whiteColor,
            borderRadius: BorderRadius.circular(20),
          ),
          width: double.infinity,
          margin: const EdgeInsets.only(left: 15, right: 15, bottom: 20),
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
          child: Column(
            children: [
              PostGeneralInformation(
                media: media,
                data: data,
              ),
              Stack(
                children: [
                  ImagesPageView(
                    media: media,
                    aspectRatio: 1,
                  ),
                  HeartButtonWithLikes(instagramData: media.likes!.summary!),
                ],
              ),
              Caption(media: media),
            ],
          ),
        ),
      ],
    );
  }
}

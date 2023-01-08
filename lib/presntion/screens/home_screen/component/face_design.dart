import 'package:flutter/material.dart';

import '../../../../models/model/facebook_data.dart';
import '../../facebook_posts/components/caption.dart';
import '../../facebook_posts/components/heart_button_with_likes.dart';
import '../../facebook_posts/components/images_page_view.dart';

class FaceDesign extends StatelessWidget {
  const FaceDesign({Key? key, required this.media}) : super(key: key);
  final Data media;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(children: [
        Row(
          children: [
            Expanded(
              child: Stack(
                children: [
                  ImagesPageView(media: media),
                  HeartButtonWithLikes(instagramData: media.likes!.summary!),
                ],
              ),
            ),
            Expanded(child: Caption(media: media))
          ],
        ),
      ]),
    );
  }
}

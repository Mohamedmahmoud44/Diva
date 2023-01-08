import 'package:flutter/material.dart';

import '../../../../models/model/instagram_data.dart';
import '../../instagram_screen/components/caption.dart';
import '../../instagram_screen/components/heart_button_with_likes.dart';
import '../../instagram_screen/components/images_page_view.dart';

class InstaDesign extends StatelessWidget {
  const InstaDesign({Key? key, required this.media}) : super(key: key);
  final InstagramData media;

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
                  HeartButtonWithLikes(instagramData: media),
                ],
              ),
            ),
            Expanded(child: Caption(media: media)),
          ],
        ),
      ]),
    );
  }
}

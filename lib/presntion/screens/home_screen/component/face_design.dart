import 'package:flutter/material.dart';

import '../../../../models/model/facebook_data.dart';
import '../../facebook_posts_screen/components/caption.dart';
import '../../facebook_posts_screen/components/images_page_view.dart';

class FaceDesign extends StatelessWidget {
  const FaceDesign({Key? key, required this.media}) : super(key: key);
  final FacebookData media;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Row(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    ImagesPageView(media: media),
                  ],
                ),
              ),
              Expanded(child: Caption(media: media))
            ],
          ),
        ],
      ),
    );
  }
}

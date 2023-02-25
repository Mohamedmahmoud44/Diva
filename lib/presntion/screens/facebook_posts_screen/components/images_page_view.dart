import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../models/model/facebook_data.dart';

class ImagesPageView extends StatelessWidget {
  const ImagesPageView({super.key, required this.media, this.aspectRatio = 1});

  final FacebookData media;
  final double aspectRatio;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: AspectRatio(
        aspectRatio: aspectRatio,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.r),
          child: InkWell(
            onTap: () async {
              if (!await launchUrl(Uri.parse(media.permalinkUrl!),
                  mode: LaunchMode.externalApplication)) {
                throw 'Could not launch ${media.permalinkUrl!}';
              }
            },
            child: Container(
              child: media.fullPicture!=null?CachedNetworkImage(
                imageUrl: media.fullPicture!,
                fit: BoxFit.cover,
              ):Container(),
            ),
          ),
        ),
      ),
    );
  }
}

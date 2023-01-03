import 'package:cached_network_image/cached_network_image.dart';
import 'package:diva_final_project/models/instagram.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/app_color.dart';
import 'information.dart';

class ImagePost extends StatefulWidget {
  const ImagePost({
    Key? key,
    required this.media,
  }) : super(key: key);
  final InstagramData media;

  @override
  State<ImagePost> createState() => _ImagePostState();
}

class _ImagePostState extends State<ImagePost> {
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
        children: [
          Information(),
          // Semantics(
          //   label: "time of publish differance from now",
          //   child: Text(
          //     "${DateTime.now().difference(
          //       DateFormat.y().parse(widget.media.timestamp!, true),
          //     )}'min ago'}",
          //     style: Theme.of(context).textTheme.titleMedium,
          //   ),
          // ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 3),
            child: AspectRatio(
              aspectRatio: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: ScrollConfiguration(
                  behavior: const ScrollBehavior().copyWith(
                    overscroll: false,
                  ),
                  child: PageView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => InkWell(
                      onTap: () async {
                        if (!await launchUrl(Uri.parse(widget.media.permalink!),
                            mode: LaunchMode.externalApplication)) {
                          throw 'Could not launch ${widget.media.permalink!}';
                        }
                      },
                      child: Container(
                        height: 450,
                        decoration: BoxDecoration(),
                        child: CachedNetworkImage(
                          imageUrl: widget.media.mediaUrl!,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
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
                  maxLines: 3,
                  TextSpan(
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                          fontWeight: FontWeight.w400,
                          color: AppColor.blackColor.withOpacity(1),
                          fontSize: 14,
                        ),
                    children: [
                      // TextSpan(
                      // text: "${post.title} ",
                      // style: const TextStyle(
                      // fontWeight: FontWeight.bold,
                      // ),
                      // ),
                      TextSpan(
                        text: widget.media.caption,
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

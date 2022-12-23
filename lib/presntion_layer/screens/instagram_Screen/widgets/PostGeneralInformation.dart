import 'package:flutter/material.dart';

import '../../../../core/icons.dart';
import '../../../../models/IURPost_model.dart';

class PostGeneralInformation extends StatelessWidget {
  const PostGeneralInformation({
    Key? key,
    required this.post,
  }) : super(key: key);

  final IURPostModel post;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: "general information about post, authorName, authorImg",
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 10,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Semantics(
                  label: "author image",
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 20,
                    backgroundImage: AssetImage(post.authorImgPath),
                  ),
                ),
                const SizedBox(width: 15),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Semantics(
                      label: "author name",
                      child: Text(
                        post.authorName,
                        style: Theme.of(context).textTheme.headline3,
                      ),
                    ),
                    Semantics(
                      label: "time of publish differance from now",
                      child: Text(
                        "${DateTime.now().difference(post.timeOfPublish).inMinutes} min ago",
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                SvgIconsHelper.fromSvg(
                  svgPath: "assets/icons/send.svg",
                  semanticLabel: "send icon",
                  size: 20,
                  color: Theme.of(context).primaryColor.withOpacity(.6),
                ),
                const SizedBox(width: 10),
                SvgIconsHelper.fromSvg(
                  svgPath: "assets/icons/items.svg",
                  semanticLabel: "items icon",
                  size: 15,
                  color: Theme.of(context).primaryColor.withOpacity(.6),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Information extends StatelessWidget {
  const Information({Key? key}) : super(key: key);

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
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: CachedNetworkImage(
                        imageUrl:
                            'https://scontent.fcai19-1.fna.fbcdn.net/v/t51.2885-15/271536885_900239140517020_8856348594862055659_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=86c713&_nc_ohc=c_QCMMkimykAX8fLhXT&_nc_ht=scontent.fcai19-1.fna&edm=AJdBtusEAAAA&oh=00_AfA_2PoSnndt79fGpSFJyCTSR45S--WyQFh0EwoIpL3DSw&oe=63B72AFE',
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Semantics(
                      label: "author name",
                      child: Text('magic_mashallah_store',
                          style: Theme.of(context).textTheme.bodySmall),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

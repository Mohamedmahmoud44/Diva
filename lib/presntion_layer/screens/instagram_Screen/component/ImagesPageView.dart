import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' show Client;

import '../../../../controllers/home_screen_controller/home_screen_controller.dart';
import '../../../../models/IURPost_model.dart';
import '../../../../models/instagram.dart';

class ImagesPageView extends StatefulWidget {
  const ImagesPageView({
    Key? key,
    required this.homeScreenController,
    required this.post,
  }) : super(key: key);

  final HomeScreenController homeScreenController;
  final IURPostModel post;

  @override
  State<ImagesPageView> createState() => _ImagesPageViewState();
}

class _ImagesPageViewState extends State<ImagesPageView> {
  String fbUrl =
      'https://graph.facebook.com/v15.0/17841445284244108?fields=media_count%2Cbusiness_discovery.username(magic_mashallah_store)%7Bfollowers_count%2Cmedia%7Bmedia_url%2Cmedia_product_type%2Ccaption%2Cmedia_type%2Cpermalink%2Ctimestamp%7D%7D&access_token=EAAMuZBf9MrtsBAFNUhRCpVv84auk9Sw0rqWHrnTzByAYyBolRptdyVZBfidskmjzzph6620kOdJaACRb7R9aDOQRiPvten7dxyFcZBqq1HSIPNTG6Sgoe5UPysHCzYpyUKVX2A46CLNse3qt7QXbZBsdVBjIWCGTSddosq0yUzEIIZBkTDO5Y';
  List<InstagramData> fbDataList = [];
  Client client = Client();

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  Future fetchData() async {
    try {
      final response = await client.get(Uri.parse(fbUrl));
      if (response.statusCode == 200) {
        Iterable i =
            json.decode(response.body)['business_discovery']['media']['data'];
        setState(() {
          fbDataList = i.map((data) => InstagramData.fromJson(data)).toList();
        });
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 3),
      child: AspectRatio(
        aspectRatio: 1,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: ScrollConfiguration(
            behavior: const ScrollBehavior().copyWith(
              overscroll: false,
            ),
            child: Column(
              children: [
                PageView.builder(
                  controller: widget.post.iURPostModelPageController,
                  clipBehavior: Clip.hardEdge,
                  itemCount: fbDataList.length,
                  itemBuilder: (context, index) => NewWidget(
                    data: fbDataList[index],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    super.key,
    required this.data,
  });

  final InstagramData data;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: CachedNetworkImage(
        imageUrl: data.mediaUrl!,
        fit: BoxFit.cover,
      ),
    );
  }
}

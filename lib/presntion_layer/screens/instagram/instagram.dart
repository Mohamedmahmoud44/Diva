import 'dart:convert';

import 'package:diva_final_project/cubit/instagram_posts/instagram_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' show Client;

import '../../../cubit/instagram_posts/instagram_cubit.dart';
import '../../../models/instagram.dart';
import 'instagra_post.dart';

class InstagramPost extends StatefulWidget {
  const InstagramPost({Key? key}) : super(key: key);

  @override
  State<InstagramPost> createState() => _InstagramPostState();
}

class _InstagramPostState extends State<InstagramPost> {
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
    return BlocConsumer<InstagramPostsCubit, InstagramPostsStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = InstagramPostsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            leading: BackButton(
              color: Colors.black,
            ),
            title: SvgPicture.asset(
              'assets/svg/ic_instagram.svg',
              color: Colors.black,
              height: 50,
            ),
            elevation: 0,
            centerTitle: true,
            backgroundColor: Colors.transparent,
          ),
          body: cubit.instData?.businessDiscovery?.media?.data != null
              ? ListView.builder(
                  clipBehavior: Clip.hardEdge,
                  itemBuilder: (context, index) => ImagePost(
                    media:
                        cubit.instData!.businessDiscovery!.media!.data![index],
                  ),
                  itemCount:
                      cubit.instData!.businessDiscovery!.media!.data!.length,
                )
              : Center(
                  child: CircularProgressIndicator(),
                ),
        );
      },
    );
  }
}

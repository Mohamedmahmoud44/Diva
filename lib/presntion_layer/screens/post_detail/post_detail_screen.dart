import 'dart:convert';

import 'package:diva_final_project/cubit/facebook_posts/facebook_cubit.dart';
import 'package:diva_final_project/cubit/facebook_posts/facebook_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' show Client;

import '../../../models/fb_data.dart';
import 'facebook_posts.dart';

class PostDetails extends StatefulWidget {
  const PostDetails({Key? key}) : super(key: key);

  @override
  State<PostDetails> createState() => _PostDetailsState();
}

class _PostDetailsState extends State<PostDetails> {
  String fbUrl =
      'https://graph.facebook.com/v15.0/272272949882404?fields=feed%7Bpermalink_url%2Cmessage%2Cfull_picture%2Ccreated_time%7D&access_token=EAAVoclWUZCSABAGNTqVBF2RdwVPJKFk9sNFYsXwrxx9SOykbBQGg3BIeXtQNg3nOmFLn3MB8OavKPjuWawUJiyOlFceidJreT24DviNNTLTGR3zQt9ndY80VaaZBFNLxudd1MPlDpoal6gPevAuWCrFp7MXlhH2ChuZBDM0eKyoAgKyW0JOZADwtgCZBjZCtzJjohGkuv29gZDZD';
  List<Data> fbDataList = [];
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
        Iterable i = json.decode(response.body)['feed']['data'];
        setState(() {
          fbDataList = i.map((data) => Data.fromJson(data)).toList();
        });
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FacebookPostsCubit, FacebookPostsStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = FacebookPostsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            leading: BackButton(
              color: Colors.black,
            ),
            title: SvgPicture.asset(
              'assets/svg/facebook-5-logo-svgrepo-com.svg',
              color: Colors.blue,
              height: 150,
            ),
            elevation: 0,
            centerTitle: true,
            backgroundColor: Colors.transparent,
          ),
          body: Directionality(
            textDirection: TextDirection.rtl,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: cubit.fbData?.feed?.data! != null
                  ? ListView.separated(
                      separatorBuilder: (context, index) => SizedBox(
                        height: 15.h,
                      ),
                      itemCount: cubit.fbData!.feed!.data!.length,
                      itemBuilder: (context, index) => FaceBookPosts(
                        fbData: cubit.fbData!.feed!.data![index],
                      ),
                    )
                  : Center(
                      child: CircularProgressIndicator(),
                    ),
            ),
          ),
        );
      },
    );
  }
}

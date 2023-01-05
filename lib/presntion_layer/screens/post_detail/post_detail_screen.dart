
import 'package:diva_final_project/cubit/facebook_posts/facebook_cubit.dart';
import 'package:diva_final_project/cubit/facebook_posts/facebook_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'facebook_posts.dart';

class PostDetails extends StatefulWidget {
  const PostDetails({Key? key}) : super(key: key);

  @override
  State<PostDetails> createState() => _PostDetailsState();
}

class _PostDetailsState extends State<PostDetails> {


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

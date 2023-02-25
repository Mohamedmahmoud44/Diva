import 'package:diva_final_project/presntion/screens/home_screen/component/video_view_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../cubit/facebook_video/facebook_video_cubit.dart';
import '../../../../cubit/facebook_video/facebook_video_states.dart';

class FacebookVideoPosts extends StatelessWidget {
  const FacebookVideoPosts({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FaceBookVideoCubit, FaceBookVideoStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit =
            FaceBookVideoCubit.get(context).fbVideos?.videos?.data;
        return SizedBox(
            height: 220.h,
            child: cubit != null
                ? ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => VideoPlayerView(
                  data: cubit[index],
                ),
                itemCount: 1)
                : Center(
              child: CircularProgressIndicator(),
            ));
      },
    );
  }
}

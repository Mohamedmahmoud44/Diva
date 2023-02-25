import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../cubit/facebook_video/facebook_video_cubit.dart';
import '../../../../cubit/facebook_video/facebook_video_states.dart';
import 'frjk_video.dart';

class FacebookVideoView extends StatelessWidget {
  const FacebookVideoView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FaceBookVideoCubit, FaceBookVideoStates>(
        listener: (context, state) {
          // TODO: implement listener
        }, builder: (context, state) {
      var cubit =
          FaceBookVideoCubit.get(context).fbVideos?.videos?.data;
      return SizedBox(
          height: 700.h,
          child: cubit != null
              ? ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => VideoScreen(
                data: cubit[index],
              ),
              itemCount: 2)
              : Center(
            child: CircularProgressIndicator(),
          ));
    });
  }
}

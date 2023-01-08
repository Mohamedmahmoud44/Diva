import 'package:diva_final_project/cubit/facebook_posts/facebook_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/app_color.dart';
import '../../../core/app_style.dart';
import '../../../cubit/facebook_posts/facebook_states.dart';
import 'components/instagra_post.dart';

class FaceBookPost extends StatelessWidget {
  const FaceBookPost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FacebookPostsCubit, FacebookPostsStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = FacebookPostsCubit.get(context);
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              leading: BackButton(
                color: AppColor.blackColor,
              ),
              title: SvgPicture.asset(
                'assets/svg/Facebook_Logo_(2015)_light.svg',
                // fit: BoxFit.none,
                height: 20,
                color: Colors.blue,
              ),
              centerTitle: true,
              elevation: 0,
              backgroundColor: Colors.transparent,
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Text(
                        'Explore',
                        style: titleStyle.copyWith(
                            color: AppColor.blackColor, fontSize: 30.sp),
                      )),
                  if (cubit.fbData?.feed?.data?.length != null)
                    ...List.generate(
                      cubit.fbData!.feed!.data!.length,
                      (index) => ImagePost(
                        media: cubit.fbData!.feed!.data![index],
                      ),
                    ),
                  Center(
                    child: CircularProgressIndicator(),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

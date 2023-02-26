import 'package:diva_final_project/cubit/instagram_posts/instagram_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/app_color.dart';
import '../../../core/app_style.dart';
import '../../../cubit/instagram_posts/instagram_cubit.dart';
import 'components/instagra_post.dart';

class InstagramPost extends StatefulWidget {
  const InstagramPost({Key? key}) : super(key: key);

  @override
  State<InstagramPost> createState() => _InstagramPostState();
}

class _InstagramPostState extends State<InstagramPost> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<InstagramPostsCubit, InstagramPostsStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = InstagramPostsCubit.get(context);
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              leading: BackButton(
                color: Colors.black,
              ),
              title: SvgPicture.asset(
                'assets/svg/ic_instagram.svg',
                fit: BoxFit.none,
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
                  if (cubit.instData?.businessDiscovery?.media?.data != null)
                    ...List.generate(
                      cubit.instData!.businessDiscovery!.media!.data!.length,
                      (index) => ImagePost(
                        media: cubit
                            .instData!.businessDiscovery!.media!.data![index],
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

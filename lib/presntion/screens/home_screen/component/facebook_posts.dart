import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/app_color.dart';
import '../../../../core/app_style.dart';
import '../../../../cubit/facebook_posts/facebook_cubit.dart';
import '../../../../cubit/facebook_posts/facebook_states.dart';
import '../../../widgets/components.dart';
import '../../facebook_posts_screen/instagram.dart';
import 'facebook_feed.dart';

class FacebookPosts extends StatelessWidget {
  const FacebookPosts({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FacebookPostsCubit, FacebookPostsStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = FacebookPostsCubit.get(context);
        if (cubit.fbData?.feed?.data! != null)
          return Container(
            decoration: BoxDecoration(
              color: AppColor.whiteColor,
              borderRadius: BorderRadius.circular(20),
            ),
            width: double.infinity,
            margin: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
            padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 15),
            child: Column(
              children: [
                cubit.fbData!.feed!.data!=null? ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: 2,
                  itemBuilder: (context, index) => FacebookFeed(
                    data: cubit.fbData!.feed!.data![index],
                    fbData: cubit.fbData!,
                  ),
                ):CircularProgressIndicator(),
                ElevatedButton(
                  onPressed: () {
                    navigateTo(context, FaceBookPost());
                  },
                  child: Text(
                    'عرض الكل',
                    style: bodyStyle.copyWith(color: AppColor.whiteColor),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.pinkColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
              ],
            ),
          );
        else
          return Center(
            child: CircularProgressIndicator(),
          );
      },
    );
  }
}

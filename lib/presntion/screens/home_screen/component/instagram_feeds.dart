import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/app_color.dart';
import '../../../../core/app_style.dart';
import '../../../../cubit/instagram_posts/instagram_cubit.dart';
import '../../../../cubit/instagram_posts/instagram_states.dart';
import '../../../widgets/components.dart';
import '../../instagram_screen/instagram.dart';
import 'insta_design.dart';

class InstagramFeeds extends StatelessWidget {
  const InstagramFeeds({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<InstagramPostsCubit, InstagramPostsStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = InstagramPostsCubit.get(context);
        if (cubit.instData?.businessDiscovery?.media?.data != null)
          return Container(
            decoration: BoxDecoration(
              color: AppColor.whiteColor,
              borderRadius: BorderRadius.circular(20),
            ),
            width: double.infinity,
            margin: const EdgeInsets.only(
                left: 15, right: 15, bottom: 10),
            padding: const EdgeInsets.symmetric(
                horizontal: 1, vertical: 15),
            child: Column(
              children: [
                ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: 2,
                  itemBuilder: (context, index) => InstaDesign(
                    media: cubit.instData!.businessDiscovery!.media!
                        .data![index],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    navigateTo(context, InstagramPost());
                  },
                  child: Text(
                    'عرض الكل',
                    style: bodyStyle.copyWith(
                        color: AppColor.whiteColor),
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

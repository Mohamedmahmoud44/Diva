import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/app_color.dart';
import '../core/app_style.dart';
import '../core/icon_root.dart';
import '../core/image_root.dart';
import '../cubit/home_page_cubit.dart';
import '../cubit/home_page_states.dart';
import '../models/drawer_model.dart';
import 'screens/notification_screen/notification_screen.dart';
import 'widgets/compnnents.dart';
import 'widgets/custom_app_bar.dart';
import 'widgets/drawer_content.dart';

class HomePageLayoutScreen extends StatelessWidget {
  const HomePageLayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomePageCubit, HomePageStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = HomePageCubit.get(context);
        return Scaffold(
          backgroundColor: AppColor.whiteColor,
          appBar: CustomAppBar(
            title: cubit.titleList[cubit.currentIndex],
            appBar: AppBar(),
            leadingIcon: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: ImageIcon(
                    AssetImage(IconRoot.sliderIcon),
                    color: AppColor.lightBlackColor,
                  ),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                );
              },
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    navigateTo(context, NotificationScreen());
                  },
                  icon: Icon(
                    Icons.notifications_active,
                    color: AppColor.blackColor,
                  ))
            ],
          ),
          drawer: Drawer(
            backgroundColor: AppColor.whiteColor,
            child: ListView(
              children: [
                DrawerHeader(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 70.r,
                        height: 70.r,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: AppColor.pinkColor.withOpacity(0.2)),
                            borderRadius: BorderRadius.circular(70.r)),
                        child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          child: Image.asset(
                            ImageRoot.divaLogo,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'Diva center',
                          style: bodyStyle2.copyWith(
                            color: AppColor.purpleColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => DrawerContent(
                    drawerModel: drawerList[index],
                  ),
                  itemCount: drawerList.length,
                )
              ],
            ),
          ),
          bottomNavigationBar: SizedBox(
            height: 81,
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: BottomNavigationBar(
                items: cubit.bottomNavBarItems,
                selectedItemColor: AppColor.pinkColor,
                unselectedItemColor: AppColor.greyColor,
                currentIndex: cubit.currentIndex,
                showSelectedLabels: true,
                showUnselectedLabels: true,
                onTap: (index) => cubit.changeBottomNavBarIndex(index),
              ),
            ),
          ),
          body: Directionality(
              textDirection: TextDirection.rtl,
              child: cubit.bottomNavScreens[cubit.currentIndex]),
        );
      },
    );
  }
}

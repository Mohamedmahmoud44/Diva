import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../core/app_color.dart';
import '../../../core/app_style.dart';
import '../../../cubit/home_page/home_page_cubit.dart';
import '../../../cubit/home_page/home_page_states.dart';
import '../../../models/drawer_model.dart';
import '../../floating_action_button.dart';
import '../../widgets/build_social_media_icon.dart';
import '../../widgets/components.dart';
import '../../widgets/custom_app_bar.dart';
import '../notification_screen/notification_screen.dart';
import 'components/drawer_content.dart';
import 'components/drawer_header_content.dart';
import 'components/logout_button.dart';

class HomePageLayoutScreen extends StatelessWidget {
  const HomePageLayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return BlocConsumer<HomePageCubit, HomePageStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = HomePageCubit.get(context);
        return Scaffold(
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          floatingActionButton: Floating(),
          appBar: CustomAppBar(
            title: cubit.titleList[cubit.currentIndex],
            appBar: AppBar(),
            leadingIcon: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: FaIcon(
                    FontAwesomeIcons.sliders,
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
                  Icons.notifications,
                  color: AppColor.blackColor,
                ),
              )
            ],
          ),
          drawer: Drawer(
            backgroundColor: AppColor.whiteColor,
            child: ListView(
              children: [
                DrawerHeader(
                  child: DrawerHeaderContent(),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => DrawerContent(
                    drawerModel: drawerList[index],
                  ),
                  itemCount: drawerList.length,
                ),
                LogoutButton(),
                SizedBox(
                  height: height * 0.08,
                ),
                ListTile(
                  subtitle: Text(
                    'تابعنا',
                    textAlign: TextAlign.right,
                    style: titleStyle,
                  ),
                ),
                BuildSocialMediaIcons()
              ],
            ),
          ),
          bottomNavigationBar: SizedBox(
            height: height * 0.10,
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

import 'dart:developer';

import 'package:diva_final_project/cubit/log_in/log_in_cubit.dart';
import 'package:diva_final_project/cubit/log_in/log_in_states.dart';
import 'package:diva_final_project/presntion/screens/login_screen/login_screen.dart';
import 'package:diva_final_project/presntion/widgets/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/app_color.dart';
import '../../../../core/app_style.dart';
import '../../../../core/strings.dart';
import '../../../../network/local/cache_helper.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = LoginCubit.get(context);
        return Stack(alignment: Alignment.centerRight, children: [
          InkWell(
            onTap: () async {
              // cubit.logOut();
              await cubit.signOut();
              CacheHelper.removeData(key: 'token');
              navigateAndFinish(context, LoginScreen());
              log('the token is removed Success $token');
              // if (state is FacebookLoginSuccess) {
              //   CacheHelper.removeData(key: 'token');
              //   navigateAndFinish(context, LoginScreen());
              //   log('the token is removed Success $token');
              //   await BlocProvider.of<LoginCubit>(context).logOut();
              // }
              // if (state is GoogleLoginSuccess) {
              //   CacheHelper.removeData(key: 'token');
              //   navigateAndFinish(context, LoginScreen());
              //   log('the token is removed Success $token');
              //   await BlocProvider.of<LoginCubit>(context).signOut();
              // } else {
              //   Text('An Error Happend');
              // }
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              width: width * 0.8,
              height: height * 0.07,
              decoration: BoxDecoration(
                color: AppColor.lightGreyHeader,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Center(
                child: Text(
                  'تسجيل الخروج ',
                  style: bodyStyle.copyWith(color: AppColor.lightBlackColor),
                ),
              ),
            ),
          ),
          Container(
              margin: EdgeInsets.all(5),
              width: width * 0.14,
              height: height * 0.07,
              decoration: BoxDecoration(
                color: AppColor.lightBlackHeader,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Center(
                  child: FaIcon(
                FontAwesomeIcons.arrowLeft,
                size: 16,
                color: AppColor.lightBlackColor,
              ))),
        ]);
      },
    );
  }
}

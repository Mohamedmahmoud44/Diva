import 'package:diva_final_project/core/strings.dart';
import 'package:diva_final_project/cubit/log_in/log_in_cubit.dart';
import 'package:diva_final_project/cubit/log_in/log_in_states.dart';
import 'package:diva_final_project/network/local/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../core/app_color.dart';
import '../../../core/app_style.dart';
import '../../widgets/components.dart';
import '../home_page_layout/home_page_layout.dart';
import 'components/custom_button.dart';
import 'components/rounded_filed.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return BlocConsumer<LoginCubit, LoginStates>(listener: (context, state) {
      if (state is FacebookLoginSuccess || state is GoogleLoginSuccess) {
        CacheHelper.saveData(key: 'token', value: token).then(
          (value) {
            if (value) {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const HomePageLayoutScreen()),
                  (route) => false);
            }
          },
        );
      }
    }, builder: (context, state) {
      var cubit = LoginCubit.get(context);
      return SafeArea(
        child: Scaffold(
          backgroundColor: AppColor.whiteColor,
          body: Directionality(
            textDirection: TextDirection.rtl,
            child: Center(
              child: Padding(
                padding:
                    EdgeInsets.symmetric(vertical: 24.0.h, horizontal: 24.w),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Text(
                        '?????????? ????????',
                        style: titleStyle.copyWith(fontSize: 30),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        '?????? ?????????????? ????????????',
                        style: bodyStyle4.copyWith(color: AppColor.greyHeader),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: height * 0.03,
                      ),
                      RoundedTextFormFiled(
                        controller: emailController,
                        type: TextInputType.emailAddress,
                        hintText: '???????????? ????????????????????',
                        suffixIcon: Icons.email,
                        validate: (String? value) {
                          if (value!.isEmpty) {
                            // buildSnackError(
                            //     '?????????? ?????????? ???????????? ????????????????????', context);
                            return '?????????? ?????????? ???????????? ????????????????????';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      RoundedTextFormFiled(
                        controller: emailController,
                        type: TextInputType.visiblePassword,
                        hintText: '???????? ????????????',
                        suffixIcon: Icons.lock,
                        validate: (String? value) {
                          if (value!.isEmpty) {
                            // buildSnackError('???????? ???????????? ?????????? ??????', context);
                            return '???????? ???????????? ?????????? ????';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: height * 0.05,
                      ),
                      CustomButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            navigateAndFinish(context, HomePageLayoutScreen());
                          }
                        },
                        text: '????????????',
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      CustomButton(
                        isSkippedButton: true,
                        onPressed: () {
                          navigateAndFinish(context, HomePageLayoutScreen());
                        },
                        text: '????????',
                      ),
                      Spacer(),
                      CustomButton(
                        onPressed: () async {
                          await cubit.login();
                          buildSnackError('???? ?????????? ???????????? ??????????', context);
                          // navigateAndFinish(context, HomePageLayoutScreen());
                        },
                        text: '???????????? ???????????????? ?????????? ??????',
                        imageIcon: FaIcon(
                          FontAwesomeIcons.facebookF,
                          color: AppColor.whiteColor,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      CustomButton(
                        onPressed: () async {
                          await cubit.signInWithGoogle();
                          buildSnackError('???? ?????????? ???????????? ??????????', context);
                          // navigateAndFinish(context, HomePageLayoutScreen());
                        },
                        text: '???????????? ???????????????? ??????????????',
                        imageIcon: FaIcon(
                          FontAwesomeIcons.google,
                          color: AppColor.whiteColor,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> buildSnackError(
    String error, context) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      duration: const Duration(seconds: 2),
      backgroundColor: AppColor.pinkColor,
      content: SizedBox(
        height: MediaQuery.of(context).size.height * 0.05,
        child: Center(
          child: Text(error),
        ),
      ),
    ),
  );
}

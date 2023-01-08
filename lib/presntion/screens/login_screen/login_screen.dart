import 'package:animated_text_kit/animated_text_kit.dart';
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
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {
        if (state is LoginSuccess) {
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
      },
      builder: (context, state) {
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
                        AnimatedTextKit(
                          animatedTexts: [
                            TypewriterAnimatedText('تسجيل دخول',
                                textAlign: TextAlign.end,
                                textStyle: titleStyle.copyWith(fontSize: 30),
                                speed: const Duration(
                                  milliseconds: 450,
                                )),
                          ],
                          isRepeatingAnimation: false,
                          totalRepeatCount: 2,
                        ),
                        Text(
                          'اضف معلومات الدخول',
                          style:
                              bodyStyle4.copyWith(color: AppColor.greyHeader),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: height * 0.03,
                        ),
                        RoundedTextFormFiled(
                          controller: emailController,
                          type: TextInputType.emailAddress,
                          hintText: 'البريد الالكتروني',
                          suffixIcon: Icons.email,
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              // buildSnackError(
                              //     'برجاء ادخال البريد الالكتروني', context);
                              return 'برجاء ادخال البريد الالكتروني';
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
                          hintText: 'كلمه المرور',
                          suffixIcon: Icons.lock,
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              // buildSnackError('كلمه المرور قصيره جدا', context);
                              return 'كلمه المرور قصيره جد';
                              return '';
                            }
                            return null;
                          },
                        ),
                        // Spacer(),
                        SizedBox(
                          height: height * 0.05,
                        ),
                        CustomButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              navigateAndFinish(
                                  context, HomePageLayoutScreen());
                            }
                          },
                          text: 'الدخول',
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        CustomButton(
                          isSkippedButton: true,
                          onPressed: () {
                            navigateAndFinish(context, HomePageLayoutScreen());
                          },
                          text: 'تخطي',
                        ),
                        Spacer(),
                        CustomButton(
                          onPressed: () async {
                            await cubit.login();
                            buildSnackError('تم تسجيل الدخول بنجاح', context);
                            // navigateAndFinish(context, HomePageLayoutScreen());
                          },
                          text: 'الدخول باستخدام الفيس بوك',
                          imageIcon: FaIcon(FontAwesomeIcons.facebookF),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        CustomButton(
                          onPressed: () async {
                            await cubit.signInWithGoogle();
                            buildSnackError('تم تسجيل الدخول بنجاح', context);
                            // navigateAndFinish(context, HomePageLayoutScreen());
                          },
                          text: 'الدخول باستخدام الجيميل',
                          imageIcon: FaIcon(FontAwesomeIcons.goodreadsG),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
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

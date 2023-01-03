import 'package:diva_final_project/core/strings.dart';
import 'package:diva_final_project/cubit/log_in/log_in_cubit.dart';
import 'package:diva_final_project/cubit/log_in/log_in_states.dart';
import 'package:diva_final_project/network/local/cache_helper.dart';
import 'package:diva_final_project/presntion_layer/screens/register/register_screen.dart';
import 'package:diva_final_project/presntion_layer/widgets/login_component/custom_button.dart';
import 'package:diva_final_project/presntion_layer/widgets/login_component/rounded_filed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_color.dart';
import '../../../core/app_style.dart';
import '../../../core/icon_root.dart';
import '../../home_page_layout.dart';
import '../../widgets/already_have_account.dart';
import '../../widgets/compnnents.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          CacheHelper.saveData(key: 'token', value: token).then((value) {
            if (value) {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const HomePageLayoutScreen()),
                  (route) => false);
            }
          });
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
                    child: ListView(
                      physics: BouncingScrollPhysics(),
                      children: [
                        Text(
                          'تسجيل دخول',
                          style: titleStyle.copyWith(fontSize: 30),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          'اضف معلومات الدخول',
                          style:
                              bodyStyle4.copyWith(color: AppColor.greyHeader),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        RoundedTextFormFiled(
                          controller: emailController,
                          type: TextInputType.emailAddress,
                          hintText: 'البريد الالكتروني',
                          suffixIcon: Icons.email,
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              buildSnackError(
                                  'برجاء ادخال البريد الالكتروني', context);
                              return '';
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
                              buildSnackError('كلمه المرور قصيره جدا', context);
                              return '';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
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
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        CustomButton(
                          isSkippedButton: true,
                          onPressed: () {
                            navigateAndFinish(context, HomePageLayoutScreen());
                          },
                          text: 'تخطي',
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        AlreadyHaveAccount(
                          onTap: () {
                            navigateTo(context, RegisterScreen());
                          },
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.04,
                        ),
                        CustomButton(
                          onPressed: () async {
                            await cubit.login();
                          },
                          text: 'الدخول باستخدام الفيس بوك',
                          imageIcon: IconRoot.facebookIcon,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        CustomButton(
                          onPressed: () async {
                            await cubit.signInWithGoogle();
                          },
                          text: 'الدخول باستخدام الجيميل',
                          imageIcon: IconRoot.googleIcon,
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

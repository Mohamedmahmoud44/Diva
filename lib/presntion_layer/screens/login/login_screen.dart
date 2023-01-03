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

import '../../../core/icon_root.dart';
import '../../home_page_layout.dart';
import '../../widgets/already_have_account.dart';
import '../../widgets/compnnents.dart';

//lala
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

        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            actions: [
              TextButton(
                onPressed: () {
                  navigateAndFinish(context, HomePageLayoutScreen());
                },
                child: Text(
                  'تخطي',
                  style: TextStyle(color: Color(0xFfE50263), fontSize: 18),
                ),
              )
            ],
          ),
          body: Directionality(
            textDirection: TextDirection.rtl,
            child: SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 24.0.h, horizontal: 24.w),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Text(
                          'تسجيل دخول',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'اضف معلومات الدخول',
                          style: TextStyle(
                              color: Colors.black45,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        RoundedTextFormFiled(
                          controller: emailController,
                          type: TextInputType.emailAddress,
                          hintText: 'البريد الالكتروني',
                          suffixIcon: Icons.email,
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return 'برجاء ادخال البريد الالكتروني';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        RoundedTextFormFiled(
                          controller: emailController,
                          type: TextInputType.visiblePassword,
                          hintText: 'كلمه المرور',
                          suffixIcon: Icons.lock,
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return 'كلمه المرور قصيره جدا';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        CustomButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              navigateTo(context, HomePageLayoutScreen());
                            }
                          },
                          text: 'الدخول',
                        ),
                        CustomButton(
                          onPressed: () async {
                            await cubit.logOut();
                          },
                          text: 'الخروج',
                        ),
                        SizedBox(
                          height: 14.h,
                        ),
                        AlreadyHaveAccount(
                          onTap: () {
                            navigateTo(context, RegisterScreen());
                          },
                        ),
                        SizedBox(
                          height: 50.h,
                        ),
                        CustomButton(
                          onPressed: () async {
                            await cubit.login();
                          },
                          text: 'الدخول باستخدام الفيس بوك',
                          imageIcon: IconRoot.facebookIcon,
                        ),
                        SizedBox(
                          height: 14.h,
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

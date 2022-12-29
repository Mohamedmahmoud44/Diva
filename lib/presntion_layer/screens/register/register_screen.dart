import 'package:diva_final_project/presntion_layer/widgets/login_component/custom_button.dart';
import 'package:diva_final_project/presntion_layer/widgets/login_component/rounded_filed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/compnnents.dart';
import '../login/login_screen.dart';

// بسم الله الرحمن الرحيم
//22
class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var emailController = TextEditingController();
  var locationController = TextEditingController();
  var passwordController = TextEditingController();
  var passwordConController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 35.h,
                    ),
                    Text(
                      'انشاء حساب',
                      style: TextStyle(
                        fontSize: 30.sp,
                        color: const Color(0xff4A4B4D),
                      ),
                    ),
                    Text(
                      'اضف التفاصيل الخاصه بك للتسجيل',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: const Color(0xff7C7D7E),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    RoundedTextFormFiled(
                      controller: nameController,
                      type: TextInputType.text,
                      hintText: 'الاسم',
                      suffixIcon: Icons.person,
                      validate: (String? value) {
                        if (value!.isEmpty) {
                          return 'يجب كتابه الاسم';
                        }
                        return null;
                      },
                    ),
                    // Container(
                    //   decoration: BoxDecoration(
                    //     color: const Color(0xFff2F2F2),
                    //     borderRadius: BorderRadius.circular(
                    //       35.r,
                    //     ),
                    //   ),
                    //   child: TextFormField(
                    //     keyboardType: TextInputType.text,
                    //     decoration: InputDecoration(
                    //       border: OutlineInputBorder(
                    //         borderRadius: BorderRadius.circular(
                    //           35.r,
                    //         ),
                    //       ),
                    //       hintText: 'الاسم',
                    //       suffixIcon: const Icon(Icons.person),
                    //     ),
                    //   ),
                    // ),
                    SizedBox(
                      height: 20.h,
                    ),
                    RoundedTextFormFiled(
                      controller: phoneController,
                      type: TextInputType.text,
                      hintText: 'رقم الهاتف',
                      suffixIcon: Icons.phone_in_talk,
                      validate: (String? value) {
                        if (value!.isEmpty) {
                          return 'يجب كتابه رقم الهاتف';
                        }
                        return null;
                      },
                    ),
                    // Container(
                    //   decoration: BoxDecoration(
                    //     color: const Color(0xFff2F2F2),
                    //     borderRadius: BorderRadius.circular(
                    //       35.r,
                    //     ),
                    //   ),
                    //   child: TextFormField(
                    //     keyboardType: TextInputType.phone,
                    //     decoration: InputDecoration(
                    //       border: OutlineInputBorder(
                    //         borderRadius: BorderRadius.circular(
                    //           35,
                    //         ),
                    //       ),
                    //       hintText: 'رقم الهاتف',
                    //       suffixIcon: const Icon(Icons.phone_in_talk),
                    //     ),
                    //   ),
                    // ),
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
                          return 'يجب كتابه البريد الالكتروني';
                        }
                        return null;
                      },
                    ),

                    // Container(
                    //   decoration: BoxDecoration(
                    //     color: const Color(0xFff2F2F2),
                    //     borderRadius: BorderRadius.circular(
                    //       35.r,
                    //     ),
                    //   ),
                    //   child: TextFormField(
                    //     keyboardType: TextInputType.emailAddress,
                    //     decoration: InputDecoration(
                    //       border: OutlineInputBorder(
                    //         borderRadius: BorderRadius.circular(
                    //           35.r,
                    //         ),
                    //       ),
                    //       hintText: 'البريد الالكتروني',
                    //       suffixIcon: const Icon(Icons.email),
                    //     ),
                    //   ),
                    // ),
                    SizedBox(
                      height: 20.h,
                    ),
                    RoundedTextFormFiled(
                      controller: locationController,
                      type: TextInputType.text,
                      hintText: 'العنوان',
                      suffixIcon: Icons.place,
                      validate: (String? value) {
                        if (value!.isEmpty) {
                          return 'يجب كتابه العنوان';
                        }
                        return null;
                      },
                    ),
                    // Container(
                    //   decoration: BoxDecoration(
                    //     color: const Color(0xFff2F2F2),
                    //     borderRadius: BorderRadius.circular(
                    //       35.r,
                    //     ),
                    //   ),
                    //   child: TextFormField(
                    //     keyboardType: TextInputType.text,
                    //     decoration: InputDecoration(
                    //       border: OutlineInputBorder(
                    //         borderRadius: BorderRadius.circular(
                    //           35.r,
                    //         ),
                    //       ),
                    //       hintText: 'العنوان',
                    //       suffixIcon: const Icon(Icons.place),
                    //     ),
                    //   ),
                    // ),
                    SizedBox(
                      height: 20.h,
                    ),
                    RoundedTextFormFiled(
                      controller: passwordController,
                      type: TextInputType.visiblePassword,
                      hintText: 'كلمه السر',
                      suffixIcon: Icons.lock,
                      validate: (String? value) {
                        if (value!.isEmpty) {
                          return 'كلمه السر قصيره جدا';
                        }
                        return null;
                      },
                    ),
                    // Container(
                    //   decoration: BoxDecoration(
                    //     color: const Color(0xFff2F2F2),
                    //     borderRadius: BorderRadius.circular(
                    //       35.r,
                    //     ),
                    //   ),
                    //   child: TextFormField(
                    //     keyboardType: TextInputType.visiblePassword,
                    //     decoration: InputDecoration(
                    //       border: OutlineInputBorder(
                    //         borderRadius: BorderRadius.circular(
                    //           35.r,
                    //         ),
                    //       ),
                    //       hintText: 'كلمه السر',
                    //       suffixIcon: const Icon(Icons.lock),
                    //     ),
                    //   ),
                    // ),
                    SizedBox(
                      height: 20.h,
                    ),
                    RoundedTextFormFiled(
                      controller: passwordConController,
                      type: TextInputType.visiblePassword,
                      hintText: 'تأكيد كلمه السر',
                      suffixIcon: Icons.lock,
                      validate: (String? value) {
                        if (value!.isEmpty) {
                          return 'كلمه السر قصيره جدا';
                        }
                        return null;
                      },
                    ),
                    // Container(
                    //   decoration: BoxDecoration(
                    //     color: const Color(0xFff2F2F2),
                    //     borderRadius: BorderRadius.circular(
                    //       35,
                    //     ),
                    //   ),
                    //   child: TextFormField(
                    //     keyboardType: TextInputType.phone,
                    //     decoration: InputDecoration(
                    //       border: OutlineInputBorder(
                    //         borderRadius: BorderRadius.circular(
                    //           35.r,
                    //         ),
                    //       ),
                    //       hintText: 'تأكيد كلمه السر',
                    //       suffixIcon: const Icon(Icons.lock),
                    //     ),
                    //   ),
                    // ),
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomButton(
                      onPressed: () {},
                      text: 'حفظ',
                    ),
                    // Container(
                    //   width: 380.w,
                    //   height: 56.h,
                    //   decoration: BoxDecoration(
                    //       color: const Color(0xFfE50263),
                    //       borderRadius: BorderRadius.circular(
                    //         35,
                    //       )),
                    //   child: TextButton(
                    //     onPressed: () {
                    //       navigateAndFinish(context, LoginScreen());
                    //     },
                    //     child: Text(
                    //       'حفظ ',
                    //       style: TextStyle(
                    //           color: Colors.white,
                    //           fontSize: 16.sp,
                    //           fontWeight: FontWeight.normal),
                    //     ),
                    //   ),
                    // ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'هل لديك حساب؟',
                          style: TextStyle(
                            color: Colors.black38,
                            fontSize: 14.sp,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            navigateAndFinish(context, LoginScreen());
                          },
                          child: const Text(
                            'تسجيل دخول',
                            style: TextStyle(
                              color: Color(0xffE50263),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

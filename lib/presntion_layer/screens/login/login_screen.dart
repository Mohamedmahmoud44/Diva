import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_color.dart';
import '../../../core/icon_root.dart';
import '../../home_page_layout.dart';
import '../../widgets/compnnents.dart';
import '../register/register_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              padding: EdgeInsets.symmetric(vertical: 24.0.h, horizontal: 24.w),
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
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFff2F2F2),
                      borderRadius: BorderRadius.circular(
                        35.r,
                      ),
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            35.r,
                          ),
                        ),
                        hintText: 'رقم الهاتف',
                        suffixIcon: const Icon(Icons.phone_in_talk),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFff2F2F2),
                      borderRadius: BorderRadius.circular(
                        35.r,
                      ),
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            35,
                          ),
                        ),
                        hintText: 'كلمه المرور',
                        suffixIcon: const Icon(Icons.lock),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    width: 380.w,
                    height: 55.h,
                    decoration: BoxDecoration(
                        color: const Color(0xFfE50263),
                        borderRadius: BorderRadius.circular(
                          35,
                        )),
                    child: TextButton(
                      onPressed: () {
                        navigateAndFinish(
                          context,
                          const HomePageLayoutScreen(),
                        );
                      },
                      child: Text(
                        'الدخول',
                        style: TextStyle(color: Colors.white, fontSize: 14.sp),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 14.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'ليس لديك حساب؟',
                        style: TextStyle(
                          color: Colors.black38,
                          fontSize: 14.sp,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          navigateTo(context, const RegisterScreen());
                        },
                        child: const Text(
                          'انشاء حساب',
                          style: TextStyle(
                            color: Color(0xFfE50263),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  Container(
                    width: 380.w,
                    height: 55.h,
                    decoration: BoxDecoration(
                        color: const Color(0xFfE50263),
                        borderRadius: BorderRadius.circular(
                          35,
                        )),
                    child: TextButton(
                      onPressed: () {
                        navigateAndFinish(
                          context,
                          const HomePageLayoutScreen(),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ImageIcon(
                            AssetImage(IconRoot.facebookIcon),
                            color: AppColor.whiteColor,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            'الدخول باستخدام فيسبوك',
                            style:
                                TextStyle(color: Colors.white, fontSize: 14.sp),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 14.h,
                  ),
                  Container(
                    width: 380.w,
                    height: 55.h,
                    decoration: BoxDecoration(
                        color: const Color(0xFfE50263),
                        borderRadius: BorderRadius.circular(
                          35,
                        )),
                    child: TextButton(
                      onPressed: () {
                        navigateAndFinish(
                          context,
                          const HomePageLayoutScreen(),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ImageIcon(
                            AssetImage(IconRoot.googleIcon),
                            color: AppColor.whiteColor,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            'الدخول باستخدام جوجل',
                            style:
                                TextStyle(color: Colors.white, fontSize: 14.sp),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

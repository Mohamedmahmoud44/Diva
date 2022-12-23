import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/custom_app_bar.dart';

class CommunicateScreen extends StatelessWidget {
  const CommunicateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBar: AppBar(),
        title: 'اتصل بنا',
        leadingIcon: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 60.r,
                      height: 50.r,
                      color: Colors.grey[100],
                      child: Image.asset('assets/icons/facebook.png'),
                    ),
                    Container(
                      width: 60,
                      height: 50,
                      color: Colors.grey[100],
                      child: Image.asset('assets/icons/messenger.png'),
                    ),
                    Container(
                      width: 60,
                      height: 50,
                      color: Colors.grey[100],
                      child: Image.asset('assets/icons/whats.png'),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.phone_enabled,
                      size: 30.sp,
                      color: const Color(0xff4A4B4D),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'التواصل',
                          style: TextStyle(
                              fontSize: 15.sp, color: const Color(0xff4A4B4D)),
                        ),
                        Text(
                          '01155525225',
                          style: TextStyle(
                              fontSize: 10.sp, color: const Color(0xff707070)),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.email,
                      size: 30.sp,
                      color: const Color(0xff4A4B4D),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'البريد الالكتروني',
                          style: TextStyle(
                              fontSize: 15.sp, color: const Color(0xff4A4B4D)),
                        ),
                        Text(
                          'mohamedmahmoud21191@gmail.com',
                          style: TextStyle(
                              fontSize: 10.sp, color: const Color(0xff707070)),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.restore_rounded,
                      size: 30.sp,
                      color: const Color(0xff4A4B4D),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'ساعات العمل',
                          style: TextStyle(
                              fontSize: 15.sp, color: const Color(0xff4A4B4D)),
                        ),
                        Row(
                          children: [
                            Text(
                              'يوميا من 12:00 م الى 1:00 ص',
                              style: TextStyle(
                                  fontSize: 10.sp,
                                  color: const Color(0xff707070)),
                            ),
                            SizedBox(
                              width: 15.w,
                            ),
                            Text(
                              'يوم الجمعه من 3:00 م الى 1:00 ص',
                              style: TextStyle(
                                  fontSize: 10.sp,
                                  color: const Color(0xff707070)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.place_sharp,
                      size: 30.sp,
                      color: const Color(0xff4A4B4D),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'العنوان',
                          style: TextStyle(
                              fontSize: 15.sp, color: const Color(0xff4A4B4D)),
                        ),
                        Text(
                          'شارع البحر - بجوار مستشفي 6 اكتوبر اسفل مطعم كزا روزا',
                          style: TextStyle(
                              fontSize: 10.sp, color: const Color(0xff707070)),
                        ),
                      ],
                    ),
                  ],
                ),
                // SizedBox(
                //   height: 40.h,
                // ),
                SizedBox(
                  // width: 318.w,
                  // height: 190.h,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Image.asset(
                        'assets/images/map.png',
                        fit: BoxFit.cover,
                        // width: 330,
                        // height: 203,
                      ),
                      Container(
                        width: 186.r,
                        height: 32.r,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.r),
                          color: Colors.white,
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.place_sharp,
                              color: Color(0xffE50263),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            const Text(
                              'المحله الكبرى',
                              style: TextStyle(color: Color(0xff959DAD)),
                            ),
                            const Spacer(),
                            const Icon(
                              Icons.close,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // SizedBox(
                //   height: 40.h,
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

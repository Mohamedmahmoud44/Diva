import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailsScreen extends StatelessWidget {
  var pageController = PageController();

  ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: 428.w,
                height: 369.h,
                child: Image.asset(
                  'assets/images/imageProduct.png',
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 0.h,
                  right: 20.w,
                  left: 20.w,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'فستان فرح',
                          style: TextStyle(
                            fontSize: 20.sp,
                          ),
                        ),
                        const Spacer(),
                        SizedBox(
                          width: 30.w,
                          height: 30.h,
                          child: Image.asset('assets/icons/whats.png'),
                        ),
                        SizedBox(
                          width: 30.w,
                          height: 30.h,
                          child: Image.asset('assets/icons/messenger.png'),
                        ),
                        SizedBox(
                          width: 30.w,
                          height: 30.h,
                          child: Image.asset('assets/icons/facebook.png'),
                        ),
                        SizedBox(
                          width: 30.w,
                          height: 30.h,
                          child: Image.asset('assets/icons/call.png'),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Row(
                      children: [
                        Text(
                          'السعر',
                          style: TextStyle(
                            fontSize: 20.sp,
                          ),
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        Text(
                          '2500 جنيه',
                          style: TextStyle(
                            fontSize: 18.sp,
                            color: const Color(0xFfE50263),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'تقيم هذا المنتج',
                          style: TextStyle(
                              fontSize: 20.sp, color: const Color(0xff949494)),
                        ),
                        SizedBox(
                          width: 23.w,
                        ),
                        const Icon(
                          Icons.star,
                          color: Color(0xffD9D9D9),
                        ),
                        const Icon(
                          Icons.star,
                          color: Color(0xffFFE622),
                        ),
                        const Icon(
                          Icons.star,
                          color: Color(0xffFFE622),
                        ),
                        const Icon(
                          Icons.star,
                          color: Color(0xffFFE622),
                        ),
                      ],
                    ),
                    Text(
                      'الوصف',
                      style: TextStyle(
                          fontSize: 20.sp, color: const Color(0xff949494)),
                    ),
                    SizedBox(
                      width: 380.w,
                      // height: 60.h,
                      child: Text(
                        'فستان فرح تركي ابيض منفوش شامل الطرحه مستورد من  المانيا تم تجميعه من تركيا فستان 5 نجوم للبيع او للايجار',
                        style: TextStyle(color: Colors.black, fontSize: 16.sp),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          ' الألوان :',
                          style: TextStyle(
                              fontSize: 20.sp, color: const Color(0xff949494)),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Container(
                          width: 25.w,
                          height: 25.h,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 12.w,
                        ),
                        Container(
                          width: 25.w,
                          height: 25.h,
                          color: const Color(0xff2900FF),
                        ),
                        SizedBox(
                          width: 12.w,
                        ),
                        Container(
                          width: 25.w,
                          height: 25.h,
                          color: const Color(0xffFFE3B7),
                        ),
                        SizedBox(
                          width: 12.w,
                        ),
                        Container(
                          width: 25.w,
                          height: 25.h,
                          color: Colors.black,
                        ),
                      ],
                    ),
                    Text(
                      ' الكميه :',
                      style: TextStyle(
                          fontSize: 20.sp, color: const Color(0xff949494)),
                    ),
                    Container(
                      width: 130.r,
                      height: 50.r,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xFF949494),
                          ),
                          borderRadius: BorderRadius.circular(50.r)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Icon(
                            Icons.add,
                            color: Color(0xff949494),
                          ),
                          Text(
                            '1',
                            style: TextStyle(
                                fontSize: 16.sp,
                                color: const Color(0xff949494)),
                          ),
                          const Icon(
                            Icons.remove,
                            color: Color(0xff949494),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Text(
                      'التعليقات على هذا المنتج',
                      style: TextStyle(
                        fontSize: 20.sp,
                        color: const Color(0xFfE50263),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                            radius: 24.r,
                            backgroundImage:
                                const AssetImage('assets/images/male.png')),
                        SizedBox(
                          width: 15.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('john doe'),
                            SizedBox(
                              height: 10.h,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  size: 15.sp,
                                  color: const Color(0xffD9D9D9),
                                ),
                                Icon(
                                  Icons.star,
                                  size: 15.sp,
                                  color: const Color(0xffFFE622),
                                ),
                                Icon(
                                  Icons.star,
                                  size: 15.sp,
                                  color: const Color(0xffFFE622),
                                ),
                                Icon(
                                  Icons.star,
                                  size: 15.sp,
                                  color: const Color(0xffFFE622),
                                ),
                                Icon(
                                  Icons.star,
                                  size: 15.sp,
                                  color: const Color(0xffFFE622),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            const Text(
                              'اشتريته من موقع سوق المحله وبجد ',
                              style: TextStyle(),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                            radius: 24.r,
                            backgroundImage:
                                const AssetImage('assets/images/male.png')),
                        SizedBox(
                          width: 15.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('john doe'),
                            SizedBox(
                              height: 10.h,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  size: 15.sp,
                                  color: const Color(0xffD9D9D9),
                                ),
                                Icon(
                                  Icons.star,
                                  size: 15.sp,
                                  color: const Color(0xffFFE622),
                                ),
                                Icon(
                                  Icons.star,
                                  size: 15.sp,
                                  color: const Color(0xffFFE622),
                                ),
                                Icon(
                                  Icons.star,
                                  size: 15.sp,
                                  color: const Color(0xffFFE622),
                                ),
                                Icon(
                                  Icons.star,
                                  size: 15.sp,
                                  color: const Color(0xffFFE622),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            const Text(
                              'اشتريته من موقع سوق المحله وبجد ',
                              style: TextStyle(),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    Row(
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 139.w,
                                  height: 2.h,
                                  color: Colors.grey,
                                ),
                                SizedBox(
                                  width: 13.w,
                                ),
                                const Text('1'),
                                SizedBox(
                                  width: 8.w,
                                ),
                                Icon(
                                  Icons.star,
                                  size: 16.sp,
                                  color: const Color(0xffFFE622),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 11.h,
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 139.w,
                                  height: 2.h,
                                  color: Colors.grey,
                                ),
                                SizedBox(
                                  width: 13.w,
                                ),
                                const Text('2'),
                                SizedBox(
                                  width: 8.w,
                                ),
                                Icon(
                                  Icons.star,
                                  size: 16.sp,
                                  color: const Color(0xffFFE622),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 11.h,
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 139.w,
                                  height: 2.h,
                                  color: Colors.grey,
                                ),
                                SizedBox(
                                  width: 13.w,
                                ),
                                const Text('3'),
                                SizedBox(
                                  width: 8.w,
                                ),
                                Icon(
                                  Icons.star,
                                  size: 16.sp,
                                  color: const Color(0xffFFE622),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 11.h,
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 139.w,
                                  height: 2.h,
                                  color: Colors.grey,
                                ),
                                SizedBox(
                                  width: 13.w,
                                ),
                                const Text('4'),
                                SizedBox(
                                  width: 8.w,
                                ),
                                Icon(
                                  Icons.star,
                                  size: 16.sp,
                                  color: const Color(0xffFFE622),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 11.h,
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 139.w,
                                  height: 2.h,
                                  color: const Color(0xffFFE622),
                                ),
                                SizedBox(
                                  width: 13.w,
                                ),
                                const Text('5'),
                                SizedBox(
                                  width: 8.w,
                                ),
                                Icon(
                                  Icons.star,
                                  size: 16.sp,
                                  color: const Color(0xffFFE622),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Spacer(),
                        Column(
                          children: [
                            Text(
                              '4.5',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 60.sp,
                              ),
                            ),
                            Row(
                              children: const [
                                Icon(
                                  Icons.star,
                                  color: Color(0xffD9D9D9),
                                ),
                                Icon(
                                  Icons.star,
                                  color: Color(0xffFFE622),
                                ),
                                Icon(
                                  Icons.star,
                                  color: Color(0xffFFE622),
                                ),
                                Icon(
                                  Icons.star,
                                  color: Color(0xffFFE622),
                                ),
                                Icon(
                                  Icons.star,
                                  color: Color(0xffFFE622),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.person,
                                  size: 18.sp,
                                  color: Colors.grey,
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Text(
                                  'اراء العملاء',
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    color: Colors.grey,
                                  ),
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
                    Container(
                      width: 428.w,
                      height: 223.h,
                      color: Colors.grey[200],
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            child: TextFormField(
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'اكتب شيئا',
                              ),
                            ),
                          ),
                          Container(
                            width: 115.r,
                            height: 36.r,
                            decoration: BoxDecoration(
                                color: const Color(0xFfE50263),
                                borderRadius: BorderRadius.circular(
                                  15.r,
                                )),
                            child: TextButton(
                              onPressed: () {},
                              child: const Text(
                                'تعليق',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'منتجات ذات صله',
                        style: TextStyle(
                          fontSize: 24.sp,
                          color: const Color(0xffE40263),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.arrow_back_ios,
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            height: 300.h,
                            width: 500.w,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemBuilder: (context, index) => buildPageView(),
                              separatorBuilder: (context, index) =>
                                  SizedBox(width: 15.w),
                              itemCount: 3,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.arrow_forward_ios,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 150.h,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPageView() => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 154.r,
            height: 170.r,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: Image.asset(
                'assets/images/imageProduct.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Row(
            children: [
              Text(
                'فستان فرح تركي',
                style: TextStyle(
                  fontSize: 13.sp,
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              Row(
                children: [
                  ...List.generate(
                    3,
                    (index) => Icon(
                      Icons.star,
                      size: 13.sp,
                      color: const Color(0xffFFE622),
                    ),
                  )
                ],
              ),
            ],
          ),
          Text(
            '2500 جنيه',
            style: TextStyle(
              fontSize: 18.sp,
              color: const Color(0xffE40263),
            ),
          ),
        ],
      );
}

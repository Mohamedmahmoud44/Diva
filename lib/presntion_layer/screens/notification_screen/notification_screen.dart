import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/custom_app_bar.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBar: AppBar(),
        title: 'الاشعارات',
        leadingIcon: IconButton(
          onPressed: ()
          {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios,color: Colors.black,),
        ),

      ),
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: ListView.separated(
                itemBuilder: (context, index) => buildNotification(),
                separatorBuilder: (context, index) => SizedBox(
                  height: 10.h,
                ),
                itemCount: 8,
              )),
        ),
      ),
    );
  }

  Widget buildNotification() => Container(
        width: 369.w,
        height: 53.h,
        child: Column(
          children: [
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.brightness_1,
                    color: Color(0xffE50263),
                    size: 10,
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 280,
                        child: Text(
                          'تخفيضات اليوم من سنتر ديفا بمناسبه الجمعه البيضا',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 16.sp,
                            color: Color(0xff4A4B4D),
                          ),
                        ),
                      ),
                      Text(
                        'الان',
                        style: TextStyle(
                          fontFamily: 'Cairo',
                          fontSize: 12.sp,
                          color: Color(0xffB6B7B7),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      );
}

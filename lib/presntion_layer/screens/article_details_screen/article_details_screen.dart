import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_color.dart';
import '../../../core/app_style.dart';
import '../../../core/image_root.dart';

class ArticledDetailsScreen extends StatelessWidget {
  const ArticledDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: ListView(
          children: [
            Container(
              width: 428.w,
              height: 343.h,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(ImageRoot.articlePageScreenOne),
                    fit: BoxFit.cover),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.brightness_1,
                  color: AppColor.pinkColor,
                ),
                SizedBox(
                  width: 7.w,
                ),
                Expanded(
                  child: SizedBox(
                    width: 356.w,
                    child: Text(
                      'ليله الزفاف هي من الليالي التي ينتظرها الكثير والكثير من  الفتيات فهي ليله العمر لهم والليلة المنتظرة لهم وهو يوم الفرحة بالنسبة لهم لأنه من الايام التي تتمناها وتنتظرها كل فتاه ويجب أن تظهر كل فتاه بشكل مناسب للغاية لان الفتيات يعتبرون هذا اليوم بليلة العمر اي انها لا تأتي في عمرهم غير مرة واحده فحلم البنات من وهم صغار يحلمون بالفستان الابيض فهذا الفستان جميل بلونه الابيض البراق.',
                      style: bodyStyle.copyWith(color: AppColor.lightGreyColor),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.brightness_1,
                  color: AppColor.pinkColor,
                ),
                SizedBox(
                  width: 7.w,
                ),
                Expanded(
                  child: SizedBox(
                    width: 356.w,
                    child: Text(
                      'ولكن ماذا عن أشكاله الخاصة بالصيف ففي الصيف تتعدد الاشكال وتتعدد موديلات الصيف خصوصا لفساتين الزفاف ومن الصيحات الجديدة انه يتم التنسيق مع العريس ليجعلوا البدلة الخاصة به لتتناسب مع الفستان الخاصة بالفتاة ليظهروا علي افضل واحسن شكل في هذه الليلة المهمة لهم للغاي',
                      style: bodyStyle.copyWith(color: AppColor.lightGreyColor),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            TextFormField(
              maxLines: 5,
              decoration: InputDecoration(),
            )
          ],
        ),
      ),
    );
  }
}

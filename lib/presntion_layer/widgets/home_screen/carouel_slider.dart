import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_style.dart';
import '../../../models/carsouel_model.dart';

class CarouselSliderView extends StatelessWidget {
  final CarouselModels carouselModels;

  const CarouselSliderView({Key? key, required this.carouselModels})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Stack(
        children: <Widget>[
          Image.asset(
            carouselModels.image,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 50.0, horizontal: 20.0),
              child: Column(
                children: [
                  Text(
                    'فساتين أفراح 2022  ',
                    style: bodyStyle,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    ' مرحبا بكم في "ديفا" اتيلية وميك اب استوديو  ',
                    style: bodyStyle.copyWith(
                        fontSize: 14.sp, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  SizedBox(
                    width: 117.18.w,
                    height: 30.61.h,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          side: const BorderSide(color: Colors.white),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.r))),
                      child: Text(
                        'تسوق الان',
                        style: buttonStyle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

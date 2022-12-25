import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../widgets/compnnents.dart';
import '../login/login_screen.dart';

//yarb ng7na na na
//yarb onsornaaa na na
class BoardingModel {
  String? image;
  String? title;
  String? body;

  BoardingModel({
    required this.image,
    required this.title,
    required this.body,
  });
}

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<BoardingModel> boarding = [
    BoardingModel(
      image: 'assets/images/board1.png',
      title: 'اتليه ديفا',
      body: '      مرحبا بكم فى ديفا اتليه ميك اب ارتيست   \n وفساتين سواريه ',
    ),
    BoardingModel(
      image: 'assets/images/board2.png',
      title: 'اتليه ديفا',
      body: 'هتفضلى ديما متالقه  \n طول ما اختيارك الاول ديفا',
    ),
  ];

  PageController boardController = PageController();
  var isLast = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Stack(
            children: [
              PageView.builder(
                controller: boardController,
                onPageChanged: (int index) {
                  if (index == boarding.length - 1) {
                    setState(() {
                      isLast = true;
                    });
                  } else {
                    setState(() {
                      isLast = false;
                    });
                  }
                },
                itemBuilder: (context, index) => buildBoarding(boarding[index]),
                itemCount: boarding.length,
              ),
              Align(
                alignment: const Alignment(0.0, .0),
                child: SmoothPageIndicator(
                  controller: boardController,
                  count: boarding.length,
                  effect: const ExpandingDotsEffect(
                    dotColor: Colors.grey,
                    activeDotColor: Color(0xFfE50263),
                    dotHeight: 10.0,
                    spacing: 5.0,
                    dotWidth: 10.0,
                    expansionFactor: 4.0,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: 380.w,
                  height: 56.h,
                  decoration: BoxDecoration(
                    color: const Color(0xFfE50263),
                    borderRadius: BorderRadius.circular(
                      35.r,
                    ),
                  ),
                  child: TextButton(
                    onPressed: () {
                      if (isLast) {
                        navigateAndFinish(context, const LoginScreen());
                      } else {
                        boardController.nextPage(
                          duration: const Duration(
                            milliseconds: 750,
                          ),
                          curve: Curves.fastLinearToSlowEaseIn,
                        );
                      }
                    },
                    child: const Text(
                      'التالى',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildBoarding(BoardingModel model) => Column(
        children: [
          Expanded(child: Image.asset(model.image!)),
          SizedBox(
            height: 70.h,
          ),
          Text(
            '${model.title}',
            style: TextStyle(
              fontSize: 28.sp,
            ),
          ),
          Expanded(
            child: Text(
              '${model.body}',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13.sp,
                color: const Color(0xff7C7D7E),
              ),
            ),
          ),
        ],
      );
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../widgets/compnnents.dart';
import '../login/login_screen.dart';

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
      title: 'اتيليه ديفا',
      body: '      مرحبا بكم فى ديفا اتيليه ميك اب ارتيست  ',
    ),
  ];

  PageController boardController = PageController();

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
                itemBuilder: (context, index) => buildBoarding(boarding[index]),
                itemCount: boarding.length,
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
                    navigateAndFinish(context, LoginScreen());
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

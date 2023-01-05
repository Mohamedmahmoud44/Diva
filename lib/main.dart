import 'package:device_preview/device_preview.dart';
import 'package:diva_final_project/cubit/log_in/log_in_cubit.dart';
import 'package:diva_final_project/presntion_layer/screens/on_boarding/on_boarding_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'cubit/facebook_posts/facebook_cubit.dart';
import 'cubit/home_page_cubit.dart';
import 'cubit/instagram_posts/instagram_cubit.dart';
import 'cubit/observer_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // await CacheHelper.inIt();
  await Firebase.initializeApp();
  Bloc.observer = MyBlocObserver();
  // token = CacheHelper.getData(key: 'token');
  // log('The Token Generate Is ${token.toString()}');
  // bool? onBoarding = CacheHelper.getData(key: 'onBoarding');
  // log('Is Boarding Removed??${onBoarding.toString()}');
  // Widget widget;
  // if (onBoarding != null) {
  //   if (token != null) {
  //     widget = HomePageLayoutScreen();
  //   } else {
  //     widget = LoginScreen();
  //   }
  // } else {
  //   widget = OnBoardingScreen();
  // }
  // if (token != null) {
  //   widget = const HomePageLayoutScreen();
  // } else {
  //   widget = LoginScreen();
  // }
  // runApp(MyApp(widget, token));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // MyApp(this.startWidget, this.token, {super.key});
  MyApp({super.key});

  // final Widget startWidget;
  // String? token;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => HomePageCubit(),
              ),
              BlocProvider(
                create: (context) => LoginCubit(),
              ),
              BlocProvider(
                create: (context) => FacebookPostsCubit()..getAllPosts(),
              ),
              BlocProvider(
                create: (context) => InstagramPostsCubit()..getAllPosts(),
              ),
            ],
            child: MaterialApp(
                useInheritedMediaQuery: true,
                locale: DevicePreview.locale(context),
                builder: DevicePreview.appBuilder,
                theme: ThemeData(
                  primarySwatch: Colors.blue,
                  appBarTheme: const AppBarTheme(
                    systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: Colors.white,
                    ),
                  ),
                ),
                debugShowCheckedModeBanner: false,
                // home: startWidget,
                home:OnBoardingScreen()),
          );
        });
  }
}

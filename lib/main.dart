import 'dart:developer';

import 'package:diva_final_project/cubit/facebook_video/facebook_video_cubit.dart';
import 'package:diva_final_project/cubit/log_in/log_in_cubit.dart';
import 'package:diva_final_project/cubit/log_out/log_out_cubit.dart';
import 'package:diva_final_project/network/remote/dio_helper.dart';
import 'package:diva_final_project/presntion/screens/home_page_layout/home_page_layout.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_version/new_version.dart';

import 'core/strings.dart';
import 'cubit/facebook_posts/facebook_cubit.dart';
import 'cubit/home_page/home_page_cubit.dart';
import 'cubit/instagram_posts/instagram_cubit.dart';
import 'cubit/observer_cubit.dart';
import 'network/local/cache_helper.dart';
import 'presntion/screens/login_screen/login_screen.dart';
import 'presntion/screens/on_boarding/on_boarding_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  await CacheHelper.inIt();
  await Firebase.initializeApp();
  Bloc.observer = MyBlocObserver();
  token = CacheHelper.getData(key: 'token');
  log('The Token Generate Is ${token.toString()}');
  bool? onBoarding = CacheHelper.getData(key: 'onBoarding');
  log('Is Boarding Removed??${onBoarding.toString()}');
  Widget widget;
  if (onBoarding != null) {
    if (token != null) {
      widget = HomePageLayoutScreen();
    } else {
      widget = LoginScreen();
    }
  } else {
    widget = OnBoardingScreen();
  }
  runApp(MyApp(widget, token));
  // runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp(this.startWidget, this.token, {super.key});

  // MyApp({super.key});

  final Widget startWidget;
  final String? token;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void checkVersion() async {
    final newVersion = NewVersion(
      androidId: 'com.example.diva_final_project',
    );
    final status = await newVersion.getVersionStatus();
    newVersion.showUpdateDialog(
        context: context,
        versionStatus: status!,
        dialogTitle: 'تحديث',
        dismissButtonText: 'تخطي',
        dialogText: 'يوجد تحديث جديد من ' +
            '${status.localVersion}' +
            'الي' +
            '${status.storeVersion}',
        dismissAction: () {
          SystemNavigator.pop();
        },
        updateButtonText: 'تحديث الأن');
    log('DEVISE:  ' + status.localVersion);
    log('DEVISE:  ' + status.storeVersion);
  }

  void initState() {
    super.initState();
    checkVersion();
  }

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
                  create: (context) => HomePageCubit()..getArticleData(),
                ),
                BlocProvider(
                  create: (context) => LoginCubit(),
                ),
                BlocProvider(
                  create: (context) => LogoutCubit(),
                ),
                BlocProvider(
                  create: (context) => FacebookPostsCubit()..getAllPosts(),
                ),
                BlocProvider(
                    create: (context) =>
                        FaceBookVideoCubit()..getAllFaceBookVideos()),
                BlocProvider(
                  create: (context) => InstagramPostsCubit()..getAllPosts(),
                ),
                BlocProvider(
                  create: (context) =>
                      FaceBookVideoCubit()..getAllFaceBookVideos(),
                ),
              ],
              child: MaterialApp(
                title: 'Diva',
                theme: ThemeData(
                  primarySwatch: Colors.blue,
                  appBarTheme: const AppBarTheme(
                    systemOverlayStyle: SystemUiOverlayStyle(
                        statusBarColor: Colors.transparent,
                        statusBarBrightness: Brightness.light,
                        statusBarIconBrightness: Brightness.dark),
                  ),
                ),
                debugShowCheckedModeBanner: false,
                home: widget.startWidget,
              ));
        });
  }
}

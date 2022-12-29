import 'package:device_preview/device_preview.dart';
import 'package:diva_final_project/cubit/log_in/log_in_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'cubit/home_page_cubit.dart';
import 'cubit/observer_cubit.dart';
import 'network/remote/dio_helper.dart';
import 'presntion_layer/screens/splash/spalsh_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  DioHelper.init();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
                create: (context) => LoginCubit()..checkIfIsLogged(),
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
                home: const SplashScreen()),
          );
        });
  }
}

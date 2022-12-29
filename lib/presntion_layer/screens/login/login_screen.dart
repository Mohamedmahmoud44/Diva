import 'package:diva_final_project/presntion_layer/widgets/login_component/custom_button.dart';
import 'package:diva_final_project/presntion_layer/widgets/login_component/rounded_filed.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../core/app_color.dart';
import '../../../core/icon_root.dart';
import '../../home_page_layout.dart';
import '../../widgets/compnnents.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  final GoogleSignIn _googleSignIn = GoogleSignIn();

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();
  Map<String, dynamic>? _userData;
  AccessToken? _accessToken;
  bool _checking = true;

  @override
  void initState() {
    super.initState();
    _checkIfIsLogged();
  }

  Future<void> _checkIfIsLogged() async {
    final accessToken = await FacebookAuth.instance.accessToken;
    setState(() {
      _checking = false;
    });
    if (accessToken != null) {
      print("is Logged:::: ${(accessToken.toJson())}");
      // now you can call to  FacebookAuth.instance.getUserData();
      final userData = await FacebookAuth.instance.getUserData();
      // final userData = await FacebookAuth.instance.getUserData(fields: "email,birthday,friends,gender,link");
      _accessToken = accessToken;
      setState(() {
        _userData = userData;
      });
    }
  }

  void _printCredentials() {
    print(
      (_accessToken!.toJson()),
    );
  }

  Future<void> _login() async {
    final LoginResult result = await FacebookAuth.instance
        .login(); // by default we request the email and the public profile

    // loginBehavior is only supported for Android devices, for ios it will be ignored
    // final result = await FacebookAuth.instance.login(
    //   permissions: ['email', 'public_profile', 'user_birthday', 'user_friends', 'user_gender', 'user_link'],
    //   loginBehavior: LoginBehavior
    //       .DIALOG_ONLY, // (only android) show an authentication dialog instead of redirecting to facebook app
    // );

    if (result.status == LoginStatus.success) {
      _accessToken = result.accessToken;
      _printCredentials();
      // get the user data
      // by default we get the userId, email,name and picture
      final userData = await FacebookAuth.instance.getUserData();
      // final userData = await FacebookAuth.instance.getUserData(fields: "email,birthday,friends,gender,link");
      _userData = userData;
    } else {
      print(result.status);
      print(result.message);
    }

    setState(() {
      _checking = false;
    });
  }

  Future<void> _logOut() async {
    await FacebookAuth.instance.logOut();
    _accessToken = null;
    _userData = null;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {
              navigateAndFinish(context, HomePageLayoutScreen());
            },
            child: Text(
              'تخطي',
              style: TextStyle(color: Color(0xFfE50263), fontSize: 18),
            ),
          )
        ],
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 24.0.h, horizontal: 24.w),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Text(
                      'تسجيل دخول',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'اضف معلومات الدخول',
                      style: TextStyle(
                          color: Colors.black45,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    RoundedTextFormFiled(
                      controller: emailController,
                      type: TextInputType.emailAddress,
                      hintText: 'البريد الالكتروني',
                      suffixIcon: Icons.email,
                      validate: (String? value) {
                        if (value!.isEmpty) {
                          return 'برجاء ادخال البريد الالكتروني';
                        }
                        return null;
                      },
                    ),
                    // Container(
                    //   decoration: BoxDecoration(
                    //     color: const Color(0xFff2F2F2),
                    //     borderRadius: BorderRadius.circular(
                    //       35.r,
                    //     ),
                    //   ),
                    //   child: TextFormField(
                    //     validator: (String? value) {
                    //       if (value!.isEmpty) {
                    //         return 'برجاء ادخال البريد الالكتروني';
                    //       }
                    //       return null;
                    //     },
                    //     controller: emailController,
                    //     keyboardType: TextInputType.emailAddress,
                    //     decoration: InputDecoration(
                    //       border: OutlineInputBorder(
                    //         borderRadius: BorderRadius.circular(
                    //           35.r,
                    //         ),
                    //       ),
                    //       hintText: 'البريد الالكتروني',
                    //       suffixIcon: const Icon(Icons.email),
                    //     ),
                    //   ),
                    // ),
                    SizedBox(
                      height: 20.h,
                    ),
                    RoundedTextFormFiled(
                      controller: emailController,
                      type: TextInputType.visiblePassword,
                      hintText: 'كلمه المرور',
                      suffixIcon: Icons.lock,
                      validate: (String? value) {
                        if (value!.isEmpty) {
                          return 'كلمه المرور قصيره جدا';
                        }
                        return null;
                      },
                    ),
                    // Container(
                    //   decoration: BoxDecoration(
                    //     color: const Color(0xFff2F2F2),
                    //     borderRadius: BorderRadius.circular(
                    //       35.r,
                    //     ),
                    //   ),
                    //   child: TextFormField(
                    //     controller: passwordController,
                    //     keyboardType: TextInputType.visiblePassword,
                    //     validator: (String? value) {
                    //       if (value!.isEmpty) {
                    //         return 'برجاء ادخال كلمه السر';
                    //       }
                    //       return null;
                    //     },
                    //     decoration: InputDecoration(
                    //       border: OutlineInputBorder(
                    //         borderRadius: BorderRadius.circular(
                    //           35,
                    //         ),
                    //       ),
                    //       hintText: 'كلمه المرور',
                    //       suffixIcon: const Icon(Icons.lock),
                    //     ),
                    //   ),
                    // ),
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomButton(
                      onPressed: () {},
                      text: 'الدخول',
                    ),
                    // Container(
                    //   width: 380.w,
                    //   height: 55.h,
                    //   decoration: BoxDecoration(
                    //       color: const Color(0xFfE50263),
                    //       borderRadius: BorderRadius.circular(
                    //         35,
                    //       )),
                    //   child: TextButton(
                    //     onPressed: () {
                    //       navigateAndFinish(
                    //         context,
                    //         const HomePageLayoutScreen(),
                    //       );
                    //     },
                    //     child: Text(
                    //       'الدخول',
                    //       style:
                    //           TextStyle(color: Colors.white, fontSize: 14.sp),
                    //     ),
                    //   ),
                    // ),
                    SizedBox(
                      height: 14.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'ليس لديك حساب؟',
                          style: TextStyle(
                            color: Colors.black38,
                            fontSize: 14.sp,
                          ),
                        ),
                        TextButton(
                          onPressed: () async {
                            if(formKey.currentState!.validate())
                            {
                              print(emailController.text);
                              print(passwordController.text);
                            }
                            // await signOut();
                          },
                          child: const Text(
                            'انشاء حساب',
                            style: TextStyle(
                              color: Color(0xFfE50263),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    CustomButton(
                      onPressed: ()
                      {
                        _userData != null ? _logOut() : _login();
                      },
                      text: 'الدخول باستخدام الفيس بوك',

                    ),
                    // Container(
                    //   width: 380.w,
                    //   height: 55.h,
                    //   decoration: BoxDecoration(
                    //       color: const Color(0xFfE50263),
                    //       borderRadius: BorderRadius.circular(
                    //         35,
                    //       )),
                    //   child: _checking
                    //       ? CircularProgressIndicator()
                    //       : TextButton(
                    //           onPressed: () =>
                    //               _userData != null ? _logOut() : _login(),
                    //           child: Row(
                    //             mainAxisAlignment: MainAxisAlignment.center,
                    //             children: [
                    //               ImageIcon(
                    //                 AssetImage(IconRoot.facebookIcon),
                    //                 color: AppColor.whiteColor,
                    //               ),
                    //               SizedBox(
                    //                 width: 10.w,
                    //               ),
                    //               Text(
                    //                 'الدخول باستخدام فيسبوك',
                    //                 style: TextStyle(
                    //                     color: Colors.white, fontSize: 14.sp),
                    //               ),
                    //             ],
                    //           ),
                    //         ),
                    // ),
                    SizedBox(
                      height: 14.h,
                    ),
                    CustomButton(
                      onPressed: ()async
                      {
                        await signInWithGoogle(context);
                      },
                      text: 'الدخول باستخدام الجيميل',

                    ),
                    // Container(
                    //   width: 380.w,
                    //   height: 55.h,
                    //   decoration: BoxDecoration(
                    //       color: const Color(0xFfE50263),
                    //       borderRadius: BorderRadius.circular(
                    //         35,
                    //       )),
                    //   child: TextButton(
                    //     onPressed: () async {
                    //       await signInWithGoogle(context);
                    //     },
                    //     child: Row(
                    //       mainAxisAlignment: MainAxisAlignment.center,
                    //       children: [
                    //         ImageIcon(
                    //           AssetImage(IconRoot.googleIcon),
                    //           color: AppColor.whiteColor,
                    //         ),
                    //         SizedBox(
                    //           width: 10.w,
                    //         ),
                    //         Text(
                    //           'الدخول باستخدام جوجل',
                    //           style: TextStyle(
                    //               color: Colors.white, fontSize: 14.sp),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> signInWithGoogle(context) async {
    GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
    GoogleSignInAuthentication authentication =
        await googleSignInAccount!.authentication;
    AuthCredential credential = GoogleAuthProvider.credential(
        idToken: authentication.idToken,
        accessToken: authentication.accessToken);
    final user = (await auth.signInWithCredential(credential)).user;
    if (user != null) {
      print('$user.email');
    }
  }

  Future<void> signOut() async {
    await _googleSignIn.signOut();
  }
}
//353

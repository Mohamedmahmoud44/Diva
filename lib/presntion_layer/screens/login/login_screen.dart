import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../core/app_color.dart';
import '../../../core/icon_root.dart';
import '../../home_page_layout.dart';
import '../../widgets/compnnents.dart';
import '../../widgets/login_component/custom_button.dart';
import '../../widgets/login_component/rounded_filed.dart';

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
      final userData = await FacebookAuth.instance.getUserData();
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
    final LoginResult result = await FacebookAuth.instance.login();

    if (result.status == LoginStatus.success) {
      _accessToken = result.accessToken;
      _printCredentials();
      // get the user data
      // by default we get the userId, email,name and picture
      final userData = await FacebookAuth.instance.getUserData();
      // final userData = await FacebookAuth.instance.getUserData(fields: "email,birthday,friends,gender,link");
      _userData = userData;
      navigateAndFinish(context, HomePageLayoutScreen());
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
                      validate: (String? value) {
                        if (value!.isEmpty) {
                          return 'برجاء ادخال البريد الالكتروني';
                        }
                      },
                      suffixIcon: Icons.email,
                      suffixPressed: () {},
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFff2F2F2),
                        borderRadius: BorderRadius.circular(
                          35.r,
                        ),
                      ),
                      child: TextFormField(
                        controller: passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'برجاء ادخال كلمه السر';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              35,
                            ),
                          ),
                          hintText: 'كلمه المرور',
                          suffixIcon: const Icon(Icons.lock),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Container(
                      width: 380.w,
                      height: 55.h,
                      decoration: BoxDecoration(
                          color: const Color(0xFfE50263),
                          borderRadius: BorderRadius.circular(
                            35,
                          )),
                      child: TextButton(
                        onPressed: () {
                          navigateAndFinish(
                            context,
                            const HomePageLayoutScreen(),
                          );
                        },
                        child: Text(
                          'الدخول',
                          style:
                              TextStyle(color: Colors.white, fontSize: 14.sp),
                        ),
                      ),
                    ),
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
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              print(emailController.text);
                              print(passwordController.text);
                            }
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
                    Container(
                      width: 380.w,
                      height: 55.h,
                      decoration: BoxDecoration(
                        color: const Color(0xFfE50263),
                        borderRadius: BorderRadius.circular(
                          35,
                        ),
                      ),
                      child: _checking
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : TextButton(
                              onPressed: _userData != null ? _logOut : _login,
                              // navigateAndFinish(
                              //   context,
                              //   const HomePageLayoutScreen(),
                              // );
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ImageIcon(
                                    AssetImage(IconRoot.facebookIcon),
                                    color: AppColor.whiteColor,
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Text(
                                    'الدخول باستخدام فيسبوك',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 14.sp),
                                  ),
                                ],
                              ),
                            ),
                    ),
                    SizedBox(
                      height: 14.h,
                    ),
                    CutomButton(
                      onPressed: () {
                        signInWithGoogle(context);
                      },
                      text: 'الدخول باستخدام جوجل',
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
                    //       signInWithGoogle(context);
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
      navigateAndFinish(context, HomePageLayoutScreen());
      print('$user.email');
    }
  }

  Future<void> signOut() async {
    await _googleSignIn.signOut();
  }
}

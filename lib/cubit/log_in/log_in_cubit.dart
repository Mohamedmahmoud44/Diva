import 'dart:developer';

import 'package:diva_final_project/cubit/log_in/log_in_states.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../core/strings.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(FacebookLoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);

  Map<String, dynamic>? userData;

  // AccessToken? _accessToken;
  // String? token = '';

  // void _printCredentials() {
  //   print(
  //     (_accessToken!.toJson()),
  //   );
  // }

  Future<void> login() async {
    try {
      emit(FacebookLoginLoading());
      final LoginResult result = await FacebookAuth.instance
          .login(); // by default we request the email and the public profile

      if (result.status == LoginStatus.success) {
        token = result.accessToken!.token;
        // _printCredentials();
        // get the user data
        // by default we get the userId, email,name and picture
        // final userDataa = await FacebookAuth.instance.getUserData();
        // final userDataa = await FacebookAuth.instance
        //     .getUserData(fields: "email,birthday,friends,gender,link");
        // final userDataa =
        //     await FacebookAuth.instance.getUserData(fields: 'email');
        // userData = userDataa;
        log(token.toString());
      } else {
        print(result.status);
        print(result.message);
      }
      emit(FacebookLoginSuccess());
    } catch (e) {
      emit(FacebookLoginFail(error: e.toString()));
      print(e.toString());
    }
  }

  Future<void> logOut() async {
    emit(FacebookLogoutLoading());
    try {
      await FacebookAuth.instance.logOut();
      token = null;
      emit(FacebookLogoutSuccess());
    } catch (e) {
      log(e.toString());
      emit(FacebookLogoutFail(error: e.toString()));
    }

    // userData = null;
    // emit(FacebookLogoutSuccess());
  }

//===========================================================================================================================================
  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<void> signInWithGoogle() async {
    emit(GoogleLoginLoading());
    try {
      GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
      GoogleSignInAuthentication authentication =
          await googleSignInAccount!.authentication;
      AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: authentication.accessToken,
        idToken: authentication.idToken,
      );
      // final user = (await auth.signInWithCredential(credential)).user;
      // if (user != null) {
      //   print('$user.email');
      // }
      token = authentication.accessToken;
      token = authentication.idToken;
      log('Google Token IS ${authentication.accessToken}||\n ${authentication.idToken}');
      emit(GoogleLoginSuccess());
    } catch (e) {
      emit(GoogleLoginFail(error: e.toString()));
      print(e.toString());
    }
  }

  Future<void> signOut() async {
    emit(GoogleLogoutLoadingState());
    try {
      await _googleSignIn.signOut();
      token = null;
      emit(GoogleLogoutSuccessState());
    } catch (e) {
      log(e.toString());
      emit(GoogleLogoutFailState(error: e.toString()));
    }
  }
//======================================================================================================================================================
}

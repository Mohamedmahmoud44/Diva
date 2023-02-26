import 'dart:developer';

import 'package:diva_final_project/cubit/log_out/log_out_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../core/strings.dart';

class LogoutCubit extends Cubit<LogoutStates> {
  LogoutCubit() : super(LogoutInitial());
  static LogoutCubit get(context) => BlocProvider.of(context);
  Future<void> logOut() async {
    emit(FacebookLogoutLoadingState());
    try {
      await FacebookAuth.instance.logOut();
      token = null;
      emit(FacebookLogoutSuccessState());
    } catch (e) {
      log(e.toString());
      emit(FacebookLogoutFailState(error: e.toString()));
    }
  }

  final GoogleSignIn _googleSignIn = GoogleSignIn();

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
}

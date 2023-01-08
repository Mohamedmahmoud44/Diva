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
      emit(LoginLoading());
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
        // log(token.toString());
      } else {
        print(result.status);
        print(result.message);
      }
      emit(LoginSuccess());
    } catch (e) {
      emit(LoginFail(error: e.toString()));
      print(e.toString());
    }
  }

  Future<void> logOut() async {
    await FacebookAuth.instance.logOut();
    token = null;
    // userData = null;
    emit(FacebookLogoutSuccess());
  }

//===========================================================================================================================================
  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<void> signInWithGoogle() async {
    emit(LoginLoading());
    try {
      GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
      GoogleSignInAuthentication authentication =
          await googleSignInAccount!.authentication;
      AuthCredential credential = GoogleAuthProvider.credential(
        idToken: authentication.idToken,
      );
      // final user = (await auth.signInWithCredential(credential)).user;
      // if (user != null) {
      //   print('$user.email');
      // }
      token = authentication.idToken;
      // log('Google Token IS $token');
      emit(LoginSuccess());
    } catch (e) {
      emit(LoginFail(error: e.toString()));
      print(e.toString());
    }
  }

  Future<void> signOut() async {
    await _googleSignIn.signOut();
  }
//======================================================================================================================================================
}

import 'package:diva_final_project/cubit/log_in/log_in_states.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(FacebookLoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);

  Map<String, dynamic>? userData;
  AccessToken? _accessToken;
  bool checking = true;

  Future<void> checkIfIsLogged() async {
    emit(FacebookLoginLoading());
    final accessToken = await FacebookAuth.instance.accessToken;
    checking = false;
    emit(FacebookLoginLoading());
    if (accessToken != null) {
      print("is Logged:::: ${(accessToken.toJson())}");
      // now you can call to  FacebookAuth.instance.getUserData();
      final userDataa = await FacebookAuth.instance.getUserData();
      // final userData = await FacebookAuth.instance.getUserData(fields: "email,birthday,friends,gender,link");
      _accessToken = accessToken;
      userData = userDataa;
      emit(FacebookLoginLoading());
    }
  }

  void _printCredentials() {
    print(
      (_accessToken!.toJson()),
    );
  }

  Future<void> login() async {
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
      final userDataa = await FacebookAuth.instance.getUserData();
      // final userData = await FacebookAuth.instance.getUserData(fields: "email,birthday,friends,gender,link");
      userData = userDataa;
    } else {
      print(result.status);
      print(result.message);
    }
    checking = false;
    emit(FacebookLoginSuccess());
  }

  Future<void> logOut() async {
    await FacebookAuth.instance.logOut();
    _accessToken = null;
    userData = null;
    emit(FacebookLogoutSuccess());
  }

//===========================================================================================================================================
  final FirebaseAuth auth = FirebaseAuth.instance;

  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<void> signInWithGoogle() async {
    emit(GoogleLoginLoading());
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
    emit(GoogleLoginSuccess());
  }

  Future<void> signOut() async {
    await _googleSignIn.signOut();
  }
  //======================================================================================================================================================



}

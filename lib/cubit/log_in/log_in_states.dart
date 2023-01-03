abstract class LoginStates {}

class FacebookLoginInitial extends LoginStates {}

//FACEBOOK LOGIN STATES
class FacebookLoginLoading extends LoginStates {}

class FacebookLoginSuccess extends LoginStates {}

class FacebookLoginFail extends LoginStates {
  final String error;

  FacebookLoginFail({required this.error});
}

//===========================================================================================================================================
//FACEBOOK LOGIN STATES
class LoginLoading extends LoginStates {}

class LoginSuccess extends LoginStates {}

class LoginFail extends LoginStates {
  final String error;

  LoginFail({required this.error});
}
//===========================================================================================================================================
//GOOGLE LOGIN STATES

class GoogleLoginLoading extends LoginStates {}

class GoogleLoginSuccess extends LoginStates {}

class GoogleLoginFail extends LoginStates {
  final String error;

  GoogleLoginFail({required this.error});
}

//===========================================================================================================================================
//FACEBOOK LOGOUT STATES
class FacebookLogoutLoading extends LoginStates {}

class FacebookLogoutSuccess extends LoginStates {}

class FacebookLogoutFail extends LoginStates {
  final String error;

  FacebookLogoutFail({required this.error});
}
//============================================================================================================================================
//login state

class LoginInitialState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class ShopLoginSuccessState extends LoginStates {}

class ShopLoginErrorState extends LoginStates {
  final String error;

  ShopLoginErrorState(this.error);
}

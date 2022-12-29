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

abstract class LogoutStates {}

class LogoutInitial extends LogoutStates {}

class FacebookLogoutLoadingState extends LogoutStates {}

class FacebookLogoutSuccessState extends LogoutStates {}

class FacebookLogoutFailState extends LogoutStates {
  final String error;
  FacebookLogoutFailState({required this.error});
}

//======================================================================================
class GoogleLogoutLoadingState extends LogoutStates {}

class GoogleLogoutSuccessState extends LogoutStates {}

class GoogleLogoutFailState extends LogoutStates {
  final String error;
  GoogleLogoutFailState({required this.error});
}

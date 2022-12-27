abstract class DivaLoginStates{}


class DivaLoginInitialState extends DivaLoginStates{}

class DivaLoginLoadingState extends DivaLoginStates{}

class DivaLoginSuccessState extends DivaLoginStates
{
  // final DivaLoginModel loginModel;
  //
  // DivaLoginSuccessState(this.loginModel);
}

class DivaLoginErrorState extends DivaLoginStates
{
  final String error;

  DivaLoginErrorState(this.error);
}
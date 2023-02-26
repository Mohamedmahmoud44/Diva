abstract class HomePageStates {}

class HomePageInitial extends HomePageStates {}

class BottomNavBarSuccessState extends HomePageStates {}

class BottomNavBarFailState extends HomePageStates {
  final String error;

  BottomNavBarFailState(this.error);
}

//====================================================================================================================================
class GetArticleLoadingState extends HomePageStates {}

class GetArticleSuccessState extends HomePageStates {}

class GetArticleFailState extends HomePageStates {
  final String error;

  GetArticleFailState(this.error);
}
//====================================================================================================================================

class GetArticleDetailsLoadingState extends HomePageStates {}

class GetArticleDetailsSuccessState extends HomePageStates {}

class GetArticleDetailsFailState extends HomePageStates {
  final String error;

  GetArticleDetailsFailState(this.error);
}

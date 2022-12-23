abstract class HomePageStates {}

class HomePageInitial extends HomePageStates {}

class BottomNavBarSuccessState extends HomePageStates {}

class BottomNavBarFailState extends HomePageStates {
  final String error;

  BottomNavBarFailState(this.error);
}

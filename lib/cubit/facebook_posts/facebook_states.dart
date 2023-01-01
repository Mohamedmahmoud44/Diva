abstract class HomePagStates {}

class HomePageInitial extends HomePagStates {}

class ProductDetailsLoading extends HomePagStates {}

class ProductDetailsSuccess extends HomePagStates {}

class ProductDetailsFail extends HomePagStates {
  final String error;

  ProductDetailsFail(this.error);
}

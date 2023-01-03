abstract class FacebookPostsStates {}

class FaceBookPostsInitial extends FacebookPostsStates {}

class FacebookPostsLoading extends FacebookPostsStates {}

class FacebookPostsSuccess extends FacebookPostsStates {}

class FacebookPostsFail extends FacebookPostsStates {
  final String error;

  FacebookPostsFail(this.error);
}

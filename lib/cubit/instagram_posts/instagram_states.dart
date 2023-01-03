abstract class InstagramPostsStates {}

class InstagramPostsInitial extends InstagramPostsStates {}

class InstagramPostsLoading extends InstagramPostsStates {}

class InstagramPostsSuccess extends InstagramPostsStates {}

class InstagramPostsFail extends InstagramPostsStates {
  final String error;

  InstagramPostsFail(this.error);
}

abstract class FaceBookVideoStates {}

class FaceBookVideoInitial extends FaceBookVideoStates {}

class FaceBookVideoLoadingState extends FaceBookVideoStates {}

class FaceBookVideoSuccessState extends FaceBookVideoStates {}

class FaceBookVideoFailState extends FaceBookVideoStates {
  final String error;
  FaceBookVideoFailState({required this.error});
}
//=================================================================================================================================

class VideoLoadingState extends FaceBookVideoStates {}

class VideoSuccessState extends FaceBookVideoStates {}

class VideoFailState extends FaceBookVideoStates {
  final String error;
  VideoFailState({required this.error});
}

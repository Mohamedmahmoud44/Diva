class IURPostModel {
  IURPostModel({
    required this.postId,
    required this.title,
    required this.description,
    required this.imgPaths,
    required this.timeOfPublish,
    required this.authorName,
    required this.authorImgPath,
    required this.tags,
    required this.iURPostModelPageController,
  });

  final iURPostModelPageController;
  String title, authorName, authorImgPath, description;
  int postId;
  List<String> imgPaths, tags;
  DateTime timeOfPublish;
}

class GetArticle {
  List<ArticleData>? data;
  int? count;

  GetArticle({this.data, this.count});

  GetArticle.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <ArticleData>[];
      json['data'].forEach((v) {
        data!.add(new ArticleData.fromJson(v));
      });
    }
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['count'] = this.count;
    return data;
  }
}

class ArticleData {
  int? id;
  int? imageId;
  String? name;

  ArticleData({this.id, this.imageId, this.name});

  ArticleData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imageId = json['imageId'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['imageId'] = this.imageId;
    data['name'] = this.name;
    return data;
  }
}

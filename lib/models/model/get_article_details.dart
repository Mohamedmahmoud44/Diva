class GetArticleDetails {
  int? id;
  int? imageId;
  String? name;
  String? description;
  List<Articles>? articles;

  GetArticleDetails(
      {this.id, this.imageId, this.name, this.description, this.articles});

  GetArticleDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imageId = json['imageId'];
    name = json['name'];
    description = json['description'];
    if (json['articles'] != null) {
      articles = <Articles>[];
      json['articles'].forEach((v) {
        articles!.add(new Articles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['imageId'] = this.imageId;
    data['name'] = this.name;
    data['description'] = this.description;
    if (this.articles != null) {
      data['articles'] = this.articles!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Articles {
  int? id;
  int? imageId;
  String? name;

  Articles({this.id, this.imageId, this.name});

  Articles.fromJson(Map<String, dynamic> json) {
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

class FBData {
  String? id;
  String? name;
  Posts? posts;
  Picture? picture;

  FBData({this.id, this.name, this.posts, this.picture});

  FBData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    posts = json['posts'] != null ? Posts.fromJson(json['posts']) : null;
    picture =
        json['picture'] != null ? Picture.fromJson(json['picture']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.posts != null) {
      data['posts'] = this.posts!.toJson();
    }
    if (this.picture != null) {
      data['picture'] = this.picture!.toJson();
    }
    return data;
  }
}

class Posts {
  List<Data>? data;
  Paging? paging;

  Posts({this.data, this.paging});

  Posts.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    paging = json['paging'] != null ? Paging.fromJson(json['paging']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.paging != null) {
      data['paging'] = this.paging!.toJson();
    }
    return data;
  }
}

class Data {
  String? permalinkUrl;
  String? message;
  String? fullPicture;
  String? id;

  Data({this.permalinkUrl, this.message, this.fullPicture, this.id});

  Data.fromJson(Map<String, dynamic> json) {
    permalinkUrl = json['permalink_url'];
    message = json['message'];
    fullPicture = json['full_picture'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['permalink_url'] = this.permalinkUrl;
    data['message'] = this.message;
    data['full_picture'] = this.fullPicture;
    data['id'] = this.id;
    return data;
  }
}

class Paging {
  Cursors? cursors;
  String? next;

  Paging({this.cursors, this.next});

  Paging.fromJson(Map<String, dynamic> json) {
    cursors =
        json['cursors'] != null ? Cursors.fromJson(json['cursors']) : null;
    next = json['next'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.cursors != null) {
      data['cursors'] = this.cursors!.toJson();
    }
    data['next'] = this.next;
    return data;
  }
}

class Cursors {
  String? before;
  String? after;

  Cursors({this.before, this.after});

  Cursors.fromJson(Map<String, dynamic> json) {
    before = json['before'];
    after = json['after'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['before'] = this.before;
    data['after'] = this.after;
    return data;
  }
}

class Picture {
  ProfileData? data;

  Picture({this.data});

  Picture.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? ProfileData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class ProfileData {
  int? height;
  bool? isSilhouette;
  String? url;
  int? width;

  ProfileData({this.height, this.isSilhouette, this.url, this.width});

  ProfileData.fromJson(Map<String, dynamic> json) {
    height = json['height'];
    isSilhouette = json['is_silhouette'];
    url = json['url'];
    width = json['width'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['height'] = this.height;
    data['is_silhouette'] = this.isSilhouette;
    data['url'] = this.url;
    data['width'] = this.width;
    return data;
  }
}

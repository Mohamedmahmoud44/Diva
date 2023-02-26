class FBData {
  Picture? picture;
  String? name;
  Feed? feed;
  String? id;

  FBData({this.picture, this.name, this.feed, this.id});

  FBData.fromJson(Map<String, dynamic> json) {
    picture =
        json['picture'] != null ? new Picture.fromJson(json['picture']) : null;
    name = json['name'];
    feed = json['feed'] != null ? new Feed.fromJson(json['feed']) : null;
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.picture != null) {
      data['picture'] = this.picture!.toJson();
    }
    data['name'] = this.name;
    if (this.feed != null) {
      data['feed'] = this.feed!.toJson();
    }
    data['id'] = this.id;
    return data;
  }
}

class Picture {
  Data? data;

  Picture({this.data});

  Picture.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? height;
  bool? isSilhouette;
  String? url;
  int? width;

  Data({this.height, this.isSilhouette, this.url, this.width});

  Data.fromJson(Map<String, dynamic> json) {
    height = json['height'];
    isSilhouette = json['is_silhouette'];
    url = json['url'];
    width = json['width'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['height'] = this.height;
    data['is_silhouette'] = this.isSilhouette;
    data['url'] = this.url;
    data['width'] = this.width;
    return data;
  }
}

class Feed {
  List<FacebookData>? data;
  Paging? paging;

  Feed({this.data, this.paging});

  Feed.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <FacebookData>[];
      json['data'].forEach((v) {
        data!.add(new FacebookData.fromJson(v));
      });
    }
    paging =
        json['paging'] != null ? new Paging.fromJson(json['paging']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.paging != null) {
      data['paging'] = this.paging!.toJson();
    }
    return data;
  }
}

class FacebookData {
  String? message;
  String? fullPicture;
  String? createdTime;
  String? permalinkUrl;
  Likes? likes;
  String? id;

  FacebookData(
      {this.message,
      this.fullPicture,
      this.createdTime,
      this.permalinkUrl,
      this.likes,
      this.id});

  FacebookData.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    fullPicture = json['full_picture'];
    createdTime = json['created_time'];
    permalinkUrl = json['permalink_url'];
    likes = json['likes'] != null ? new Likes.fromJson(json['likes']) : null;
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['full_picture'] = this.fullPicture;
    data['created_time'] = this.createdTime;
    data['permalink_url'] = this.permalinkUrl;
    if (this.likes != null) {
      data['likes'] = this.likes!.toJson();
    }
    data['id'] = this.id;
    return data;
  }
}

class Likes {
  List<Null>? data;
  Paging? paging;
  Summary? summary;

  Likes({this.data, this.paging, this.summary});

  Likes.fromJson(Map<String, dynamic> json) {
    paging =
        json['paging'] != null ? new Paging.fromJson(json['paging']) : null;
    summary =
        json['summary'] != null ? new Summary.fromJson(json['summary']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    if (this.paging != null) {
      data['paging'] = this.paging!.toJson();
    }
    if (this.summary != null) {
      data['summary'] = this.summary!.toJson();
    }
    return data;
  }
}

class Paging {
  Cursors? cursors;
  String? next;

  Paging({this.cursors, this.next});

  Paging.fromJson(Map<String, dynamic> json) {
    cursors =
        json['cursors'] != null ? new Cursors.fromJson(json['cursors']) : null;
    next = json['next'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['before'] = this.before;
    data['after'] = this.after;
    return data;
  }
}

class Summary {
  int? totalCount;
  bool? canLike;
  bool? hasLiked;

  Summary({this.totalCount, this.canLike, this.hasLiked});

  Summary.fromJson(Map<String, dynamic> json) {
    totalCount = json['total_count'];
    canLike = json['can_like'];
    hasLiked = json['has_liked'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_count'] = this.totalCount;
    data['can_like'] = this.canLike;
    data['has_liked'] = this.hasLiked;
    return data;
  }
}

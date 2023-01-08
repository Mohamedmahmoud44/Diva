class FBData {
  Feed? feed;
  String? id;

  FBData({this.feed, this.id});

  FBData.fromJson(Map<String, dynamic> json) {
    feed = json['feed'] != null ? new Feed.fromJson(json['feed']) : null;
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.feed != null) {
      data['feed'] = this.feed!.toJson();
    }
    data['id'] = this.id;
    return data;
  }
}

class Feed {
  List<Data>? data;
  Paging? paging;

  Feed({this.data, this.paging});

  Feed.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
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

class Data {
  String? message;
  String? fullPicture;
  String? createdTime;
  String? permalinkUrl;
  Likes? likes;
  Comments? comments;
  String? id;

  Data(
      {this.message,
      this.fullPicture,
      this.createdTime,
      this.permalinkUrl,
      this.likes,
      this.comments,
      this.id});

  Data.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    fullPicture = json['full_picture'];
    createdTime = json['created_time'];
    permalinkUrl = json['permalink_url'];
    likes = json['likes'] != null ? new Likes.fromJson(json['likes']) : null;
    comments = json['comments'] != null
        ? new Comments.fromJson(json['comments'])
        : null;
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
    if (this.comments != null) {
      data['comments'] = this.comments!.toJson();
    }
    data['id'] = this.id;
    return data;
  }
}

class Likes {
  Summary? summary;
  Paging? paging;

  Likes({this.summary, this.paging});

  Likes.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {}
    summary =
        json['summary'] != null ? new Summary.fromJson(json['summary']) : null;
    paging =
        json['paging'] != null ? new Paging.fromJson(json['paging']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.summary != null) {
      data['summary'] = this.summary!.toJson();
    }
    if (this.paging != null) {
      data['paging'] = this.paging!.toJson();
    }
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

class Comments {
  CommentsSummary? summary;

  Comments({this.summary});

  Comments.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {}
    summary = json['summary'] != null
        ? new CommentsSummary.fromJson(json['summary'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.summary != null) {
      data['summary'] = this.summary!.toJson();
    }
    return data;
  }
}

class CommentsSummary {
  String? order;
  int? totalCount;
  bool? canComment;

  CommentsSummary({this.order, this.totalCount, this.canComment});

  CommentsSummary.fromJson(Map<String, dynamic> json) {
    order = json['order'];
    totalCount = json['total_count'];
    canComment = json['can_comment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order'] = this.order;
    data['total_count'] = this.totalCount;
    data['can_comment'] = this.canComment;
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

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
  String? permalinkUrl;
  String? message;
  String? fullPicture;
  String? createdTime;
  String? id;

  Data(
      {this.permalinkUrl,
      this.message,
      this.fullPicture,
      this.createdTime,
      this.id});

  Data.fromJson(Map<String, dynamic> json) {
    permalinkUrl = json['permalink_url'];
    message = json['message'];
    fullPicture = json['full_picture'];
    createdTime = json['created_time'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['permalink_url'] = this.permalinkUrl;
    data['message'] = this.message;
    data['full_picture'] = this.fullPicture;
    data['created_time'] = this.createdTime;
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

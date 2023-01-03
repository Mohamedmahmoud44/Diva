class InstagramPosts {
  BusinessDiscovery? businessDiscovery;
  String? id;

  InstagramPosts({this.businessDiscovery, this.id});

  InstagramPosts.fromJson(Map<String, dynamic> json) {
    businessDiscovery = json['business_discovery'] != null
        ? new BusinessDiscovery.fromJson(json['business_discovery'])
        : null;
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.businessDiscovery != null) {
      data['business_discovery'] = this.businessDiscovery!.toJson();
    }
    data['id'] = this.id;
    return data;
  }
}

class BusinessDiscovery {
  Media? media;
  String? id;

  BusinessDiscovery({this.media, this.id});

  BusinessDiscovery.fromJson(Map<String, dynamic> json) {
    media = json['media'] != null ? new Media.fromJson(json['media']) : null;
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.media != null) {
      data['media'] = this.media!.toJson();
    }
    data['id'] = this.id;
    return data;
  }
}

class Media {
  List<InstagramData>? data;
  Paging? paging;

  Media({this.data, this.paging});

  Media.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <InstagramData>[];
      json['data'].forEach((v) {
        data!.add(new InstagramData.fromJson(v));
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

class InstagramData {
  String? mediaUrl;
  String? mediaProductType;
  String? caption;
  String? mediaType;
  String? permalink;
  String? timestamp;
  String? id;

  InstagramData(
      {this.mediaUrl,
      this.mediaProductType,
      this.caption,
      this.mediaType,
      this.permalink,
      this.timestamp,
      this.id});

  InstagramData.fromJson(Map<String, dynamic> json) {
    mediaUrl = json['media_url'];
    mediaProductType = json['media_product_type'];
    caption = json['caption'];
    mediaType = json['media_type'];
    permalink = json['permalink'];
    timestamp = json['timestamp'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['media_url'] = this.mediaUrl;
    data['media_product_type'] = this.mediaProductType;
    data['caption'] = this.caption;
    data['media_type'] = this.mediaType;
    data['permalink'] = this.permalink;
    data['timestamp'] = this.timestamp;
    data['id'] = this.id;
    return data;
  }
}

class Paging {
  Cursors? cursors;

  Paging({this.cursors});

  Paging.fromJson(Map<String, dynamic> json) {
    cursors =
        json['cursors'] != null ? new Cursors.fromJson(json['cursors']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.cursors != null) {
      data['cursors'] = this.cursors!.toJson();
    }
    return data;
  }
}

class Cursors {
  String? after;

  Cursors({this.after});

  Cursors.fromJson(Map<String, dynamic> json) {
    after = json['after'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['after'] = this.after;
    return data;
  }
}

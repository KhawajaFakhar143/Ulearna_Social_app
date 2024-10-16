import 'package:ulearna_social_app/features/reels/domain/entities/reels_entity.dart';

// class ReelsModel {
//   final int id;
//   final String title;
//   final String url;
//   final String cdnUrl;
//   final String thumbCdnUrl;
//   final int userId;
//   final String status;
//   final String slug;
//   final int categoryId;
//   final int totalViews;
//   final int totalLikes;
//   final int totalComments;
//   final int totalShare;
//   final int totalWishlist;
//   final int duration;
//   final String language;
//   final String byteAddedOn;
//   final String byteUpdatedOn;
//   final UserModel user;

//   ReelsModel({
//     required this.id,
//     required this.title,
//     required this.url,
//     required this.cdnUrl,
//     required this.thumbCdnUrl,
//     required this.userId,
//     required this.status,
//     required this.slug,
//     required this.categoryId,
//     required this.totalViews,
//     required this.totalLikes,
//     required this.totalComments,
//     required this.totalShare,
//     required this.totalWishlist,
//     required this.duration,
//     required this.language,
//     required this.byteAddedOn,
//     required this.byteUpdatedOn,
//     required this.user,
//   });

//   factory ReelsModel.fromJson(Map<String, dynamic> json) {
//     return ReelsModel(
//       id: json['id'],
//       title: json['title'],
//       url: json['url'],
//       cdnUrl: json['cdn_url'],
//       thumbCdnUrl: json['thumb_cdn_url'],
//       userId: json['user_id'],
//       status: json['status'],
//       slug: json['slug'],
//       categoryId: json['category_id'],
//       totalViews: json['total_views'],
//       totalLikes: json['total_likes'],
//       totalComments: json['total_comments'],
//       totalShare: json['total_share'],
//       totalWishlist: json['total_wishlist'],
//       duration: json['duration'],
//       language: json['language'],
//       byteAddedOn: json['byte_added_on'],
//       byteUpdatedOn: json['byte_updated_on'],
//       user: UserModel.fromJson(json['user']),
//     );
//   }

//   ReelsEntity toEntity() {
//     return ReelsEntity(
//       id: id,
//       title: title,
//       videoUrl: cdnUrl,
//       thumbnailUrl: thumbCdnUrl,
//       userId: userId,
//       status: status,
//       slug: slug,
//       categoryId: categoryId,
//       views: totalViews,
//       likes: totalLikes,
//       comments: totalComments,
//       shares: totalShare,
//       wishlists: totalWishlist,
//       duration: duration,
//       language: language,
//       createdBy: user.fullname,
//       createdAt: byteAddedOn,
//       updatedAt: byteUpdatedOn,
//       profilePicture: user.profilePictureCdn,
//       designation: user.designation,
//     );
//   }
// }

// class UserModel {
//   final int userId;
//   final String fullname;
//   final String profilePicture;
//   final String profilePictureCdn;
//   final String designation;

//   UserModel({
//     required this.userId,
//     required this.fullname,
//     required this.profilePicture,
//     required this.profilePictureCdn,
//     required this.designation,
//   });

//   factory UserModel.fromJson(Map<String, dynamic> json) {
//     return UserModel(
//       userId: json['user_id'],
//       fullname: json['fullname'],
//       profilePicture: json['profile_picture'],
//       profilePictureCdn: json['profile_picture_cdn'],
//       designation: json['designation'],
//     );
//   }
// }

class ReelsModel {
  int? statusCode;
  String? message;
  Data? data;

  ReelsModel({this.statusCode, this.message, this.data});

  ReelsModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['statusCode'] = statusCode;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }

  List<ReelsEntity> toEntity() {
    List<ReelsEntity> dataList = [];
    if (data != null) {
      if (data!.reelsData?.isNotEmpty ?? false) {
        var modelData = data!.reelsData!;
        for (var element in modelData) {
            dataList.add(ReelsEntity(
              id:  element.id ?? 0,
              title: element.title ?? "",
              videoUrl: element.cdnUrl ?? "",
              thumbnailUrl: element.thumbCdnUrl ?? "",
              userId: element.userId ?? 0,
              status: element.status ?? "",
              slug: element.slug ?? "",
              categoryId: element.categoryId ?? 0,
              views: element.totalViews ?? 0,
              likes: element.totalLikes ?? 0,
              comments: element.totalComments ?? 0,
              shares: element.totalShare ?? 0,
              wishlists: element.totalWishlist ?? 0,
              duration: element.duration ?? 0,
              language: element.language ?? "",
              createdBy: element.user?.fullname ?? "",
              createdAt: element.byteAddedOn ?? "",
              updatedAt: element.byteUpdatedOn ?? "",
              profilePicture: element.user?.profilePictureCdn ?? "",
              designation: element.user?.designation ?? "",
            ));
          }
      }
    }
    return dataList;
  }
}

class Data {
  List<ReelsData>? reelsData;
  MetaData? metaData;

  Data({this.reelsData, this.metaData});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      reelsData = <ReelsData>[];
      json['data'].forEach((v) {
        reelsData!.add(ReelsData.fromJson(v));
      });
    }
    metaData =
        json['meta_data'] != null ? MetaData.fromJson(json['meta_data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (reelsData != null) {
      data['data'] = reelsData!.map((v) => v.toJson()).toList();
    }
    if (metaData != null) {
      data['meta_data'] = metaData!.toJson();
    }
    return data;
  }
}

class ReelsData {
  int? id;
  String? title;
  String? url;
  String? cdnUrl;
  String? thumbCdnUrl;
  int? userId;
  String? status;
  String? slug;
  String? encodeStatus;
  int? priority;
  int? categoryId;
  int? totalViews;
  int? totalLikes;
  int? totalComments;
  int? totalShare;
  int? totalWishlist;
  int? duration;
  String? byteAddedOn;
  String? byteUpdatedOn;
  String? bunnyStreamVideoId;
  String? language;
  int? bunnyEncodingStatus;
  dynamic deletedAt;
  User? user;
  bool? isLiked;
  bool? isWished;
  bool? isFollow;

  ReelsData(
      {this.id,
      this.title,
      this.url,
      this.cdnUrl,
      this.thumbCdnUrl,
      this.userId,
      this.status,
      this.slug,
      this.encodeStatus,
      this.priority,
      this.categoryId,
      this.totalViews,
      this.totalLikes,
      this.totalComments,
      this.totalShare,
      this.totalWishlist,
      this.duration,
      this.byteAddedOn,
      this.byteUpdatedOn,
      this.bunnyStreamVideoId,
      this.language,
      this.bunnyEncodingStatus,
      this.deletedAt,
      this.user,
      this.isLiked,
      this.isWished,
      this.isFollow});

  ReelsData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    url = json['url'];
    cdnUrl = json['cdn_url'];
    thumbCdnUrl = json['thumb_cdn_url'];
    userId = json['user_id'];
    status = json['status'];
    slug = json['slug'];
    encodeStatus = json['encode_status'];
    priority = json['priority'];
    categoryId = json['category_id'];
    totalViews = json['total_views'];
    totalLikes = json['total_likes'];
    totalComments = json['total_comments'];
    totalShare = json['total_share'];
    totalWishlist = json['total_wishlist'];
    duration = json['duration'];
    byteAddedOn = json['byte_added_on'];
    byteUpdatedOn = json['byte_updated_on'];
    bunnyStreamVideoId = json['bunny_stream_video_id'];
    language = json['language'];
    bunnyEncodingStatus = json['bunny_encoding_status'];
    deletedAt = json['deleted_at'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    isLiked = json['is_liked'];
    isWished = json['is_wished'];
    isFollow = json['is_follow'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['url'] = url;
    data['cdn_url'] = cdnUrl;
    data['thumb_cdn_url'] = thumbCdnUrl;
    data['user_id'] = userId;
    data['status'] = status;
    data['slug'] = slug;
    data['encode_status'] = encodeStatus;
    data['priority'] = priority;
    data['category_id'] = categoryId;
    data['total_views'] = totalViews;
    data['total_likes'] = totalLikes;
    data['total_comments'] = totalComments;
    data['total_share'] = totalShare;
    data['total_wishlist'] = totalWishlist;
    data['duration'] = duration;
    data['byte_added_on'] = byteAddedOn;
    data['byte_updated_on'] = byteUpdatedOn;
    data['bunny_stream_video_id'] = bunnyStreamVideoId;
    data['language'] = language;
    data['bunny_encoding_status'] = bunnyEncodingStatus;
    data['deleted_at'] = deletedAt;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['is_liked'] = isLiked;
    data['is_wished'] = isWished;
    data['is_follow'] = isFollow;
    return data;
  }
}

class User {
  int? userId;
  String? fullname;
  String? username;
  String? profilePicture;
  String? profilePictureCdn;
  String? designation;

  User(
      {this.userId,
      this.fullname,
      this.username,
      this.profilePicture,
      this.profilePictureCdn,
      this.designation});

  User.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    fullname = json['fullname'];
    username = json['username'];
    profilePicture = json['profile_picture'];
    profilePictureCdn = json['profile_picture_cdn'];
    designation = json['designation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['fullname'] = fullname;
    data['username'] = username;
    data['profile_picture'] = profilePicture;
    data['profile_picture_cdn'] = profilePictureCdn;
    data['designation'] = designation;
    return data;
  }
}

class MetaData {
  int? total;
  int? page;
  int? limit;

  MetaData({this.total, this.page, this.limit});

  MetaData.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    page = json['page'];
    limit = json['limit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total'] = total;
    data['page'] = page;
    data['limit'] = limit;
    return data;
  }
}

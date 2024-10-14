

import 'package:ulearna_social_app/features/reels/domain/entities/reels_entity.dart';

class ReelsModel {
  final int id;
  final String title;
  final String url;
  final String cdnUrl;
  final String thumbCdnUrl;
  final int userId;
  final String status;
  final String slug;
  final int categoryId;
  final int totalViews;
  final int totalLikes;
  final int totalComments;
  final int totalShare;
  final int totalWishlist;
  final int duration;
  final String language;
  final String byteAddedOn;
  final String byteUpdatedOn;
  final UserModel user;

  ReelsModel({
    required this.id,
    required this.title,
    required this.url,
    required this.cdnUrl,
    required this.thumbCdnUrl,
    required this.userId,
    required this.status,
    required this.slug,
    required this.categoryId,
    required this.totalViews,
    required this.totalLikes,
    required this.totalComments,
    required this.totalShare,
    required this.totalWishlist,
    required this.duration,
    required this.language,
    required this.byteAddedOn,
    required this.byteUpdatedOn,
    required this.user,
  });

  factory ReelsModel.fromJson(Map<String, dynamic> json) {
    return ReelsModel(
      id: json['id'],
      title: json['title'],
      url: json['url'],
      cdnUrl: json['cdn_url'],
      thumbCdnUrl: json['thumb_cdn_url'],
      userId: json['user_id'],
      status: json['status'],
      slug: json['slug'],
      categoryId: json['category_id'],
      totalViews: json['total_views'],
      totalLikes: json['total_likes'],
      totalComments: json['total_comments'],
      totalShare: json['total_share'],
      totalWishlist: json['total_wishlist'],
      duration: json['duration'],
      language: json['language'],
      byteAddedOn: json['byte_added_on'],
      byteUpdatedOn: json['byte_updated_on'],
      user: UserModel.fromJson(json['user']),
    );
  }

  ReelsEntity toEntity() {
    return ReelsEntity(
      id: id,
      title: title,
      videoUrl: cdnUrl,
      thumbnailUrl: thumbCdnUrl,
      userId: userId,
      status: status,
      slug: slug,
      categoryId: categoryId,
      views: totalViews,
      likes: totalLikes,
      comments: totalComments,
      shares: totalShare,
      wishlists: totalWishlist,
      duration: duration,
      language: language,
      createdBy: user.fullname,
      createdAt: byteAddedOn,
      updatedAt: byteUpdatedOn,
      profilePicture: user.profilePictureCdn,
      designation: user.designation,
    );
  }
}

class UserModel {
  final int userId;
  final String fullname;
  final String profilePicture;
  final String profilePictureCdn;
  final String designation;

  UserModel({
    required this.userId,
    required this.fullname,
    required this.profilePicture,
    required this.profilePictureCdn,
    required this.designation,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json['user_id'],
      fullname: json['fullname'],
      profilePicture: json['profile_picture'],
      profilePictureCdn: json['profile_picture_cdn'],
      designation: json['designation'],
    );
  }
}

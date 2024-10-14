
class ReelsEntity {
  final int id;
  final String title;
  final String videoUrl;
  final String thumbnailUrl;
  final int userId;
  final String status;
  final String slug;
  final int categoryId;
  final int views;
  final int likes;
  final int comments;
  final int shares;
  final int wishlists;
  final int duration;
  final String language;
  final String createdBy;
  final String createdAt;
  final String updatedAt;
  final String profilePicture;
  final String designation;

  ReelsEntity({
    required this.id,
    required this.title,
    required this.videoUrl,
    required this.thumbnailUrl,
    required this.userId,
    required this.status,
    required this.slug,
    required this.categoryId,
    required this.views,
    required this.likes,
    required this.comments,
    required this.shares,
    required this.wishlists,
    required this.duration,
    required this.language,
    required this.createdBy,
    required this.createdAt,
    required this.updatedAt,
    required this.profilePicture,
    required this.designation,
  });
}


import 'dart:developer';

import 'package:equatable/equatable.dart';

class ReelsEntity extends Equatable{
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

 const ReelsEntity({
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
  
   @override
  List<Object?> get props => [
    id,
    title,
    videoUrl,
    thumbnailUrl,
    userId,
    status,
    slug,
    categoryId,
    views,
    likes,
    comments,
    shares,
    wishlists,
    duration,
    language,
    createdBy,
    createdAt,
    updatedAt,
    profilePicture,
    designation
  ];

  void logIt() {
    log('ReelsEntity {');
    log('  id: $id,');
    log('  title: $title,');
    log('  videoUrl: $videoUrl,');
    log('  thumbnailUrl: $thumbnailUrl,');
    log('  userId: $userId,');
    log('  status: $status,');
    log('  slug: $slug,');
    log('  categoryId: $categoryId,');
    log('  views: $views,');
    log('  likes: $likes,');
    log('  comments: $comments,');
    log('  shares: $shares,');
    log('  wishlists: $wishlists,');
    log('  duration: $duration,');
    log('  language: $language,');
    log('  createdBy: $createdBy,');
    log('  createdAt: $createdAt,');
    log('  updatedAt: $updatedAt,');
    log('  profilePicture: $profilePicture,');
    log('  designation: $designation');
    log('}');
  }
}

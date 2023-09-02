import 'package:equatable/equatable.dart';

import 'photo_urls.dart';
import 'user.dart';

class Photo extends Equatable {
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime promotedAt;
  final String description;
  final int likes;
  final PhotoUrls urls;
  final User user;

  const Photo({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.promotedAt,
    required this.description,
    required this.likes,
    required this.urls,
    required this.user,
  });

  Photo.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        createdAt = DateTime.parse(json['created_at']),
        updatedAt = DateTime.parse(json['updated_at']),
        promotedAt = DateTime.parse(json['promoted_at']),
        description = json['description'],
        likes = json['likes'],
        urls = PhotoUrls.fromJson(json['urls']),
        user = User.fromJson(json['user']);

  @override
  List<Object?> get props => [
        id,
        createdAt,
        updatedAt,
        promotedAt,
        description,
        likes,
        urls,
        user,
      ];
}

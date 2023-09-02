import 'package:equatable/equatable.dart';
import 'package:gallery_app/model/profile_image.dart';

class User extends Equatable {
  final String id;
  final String name;
  final String bio;
  final ProfileImage profileImage;

  const User({
    required this.id,
    required this.name,
    required this.bio,
    required this.profileImage,
  });

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        bio = json['bio'],
        profileImage = ProfileImage.fromJson(json['profile_image']);

  @override
  List<Object?> get props => [id, name, bio, profileImage];
}

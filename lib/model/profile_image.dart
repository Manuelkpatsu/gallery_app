import 'package:equatable/equatable.dart';

class ProfileImage extends Equatable {
  final String small;
  final String medium;
  final String large;

  const ProfileImage({required this.small, required this.medium, required this.large});

  ProfileImage.fromJson(Map<String, dynamic> json)
      : small = json['small'],
        medium = json['medium'],
        large = json['large'];

  @override
  List<Object?> get props => [small, medium, large];
}

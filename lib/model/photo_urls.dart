import 'package:equatable/equatable.dart';

class PhotoUrls extends Equatable {
  final String raw;
  final String full;
  final String regular;
  final String small;
  final String thumb;

  const PhotoUrls({
    required this.raw,
    required this.full,
    required this.regular,
    required this.small,
    required this.thumb,
  });

  PhotoUrls.fromJson(Map<String, dynamic> json)
      : raw = json['raw'],
        full = json['full'],
        regular = json['regular'],
        small = json['small'],
        thumb = json['thumb'];

  @override
  List<Object?> get props => [small, full, regular, small, thumb];
}

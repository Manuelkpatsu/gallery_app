import 'package:flutter/material.dart';
import 'package:gallery_app/model/photo.dart';

import 'user_widget.dart';

class PhotoTile extends StatelessWidget {
  final Photo photo;

  PhotoTile({Key? key, required this.photo}) : super(key: Key(photo.id));

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          photo.urls.regular,
          colorBlendMode: BlendMode.darken,
          color: Colors.black26,
        ),
        UserWidget(user: photo.user),
      ],
    );
  }
}

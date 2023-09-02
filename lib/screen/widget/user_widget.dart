import 'package:flutter/material.dart';
import 'package:gallery_app/model/user.dart';

import 'user_photo.dart';
import 'username_text.dart';

class UserWidget extends StatelessWidget {
  final User user;

  const UserWidget({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 7,
      right: 7,
      bottom: 10,
      child: Row(
        children: [
          UserPhoto(photo: user.profileImage.large),
          const SizedBox(width: 5),
          UsernameText(name: user.name),
        ],
      ),
    );
  }
}

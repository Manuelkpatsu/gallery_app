import 'package:flutter/material.dart';

class UserPhoto extends StatelessWidget {
  final String photo;

  const UserPhoto({super.key, required this.photo});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 15,
      backgroundImage: NetworkImage(photo),
    );
  }
}

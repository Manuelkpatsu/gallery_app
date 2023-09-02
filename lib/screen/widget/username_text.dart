import 'package:flutter/material.dart';
import 'package:gallery_app/theme/app_colors.dart';

class UsernameText extends StatelessWidget {
  final String name;

  const UsernameText({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text(
        name,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(fontSize: 12, color: AppColors.grey, fontWeight: FontWeight.w600),
      ),
    );
  }
}

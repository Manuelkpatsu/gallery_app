import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color _blackColor = Color(0xFF333333);
  static const Color _primaryColor = Color(0xFF158443);
  static const Color grey = Color(0xFFF2F6FA);
  static MaterialColor get black => _blackColor.toMaterialColor();
  static MaterialAccentColor get green => _primaryColor.toMaterialAccentColor();
}

extension _Material on Color {
  Map<int, Color> _toSwatch() => {
        50: withOpacity(0.1),
        100: withOpacity(0.2),
        200: withOpacity(0.3),
        300: withOpacity(0.4),
        400: withOpacity(0.5),
        500: withOpacity(0.6),
        600: withOpacity(0.7),
        700: withOpacity(0.8),
        800: withOpacity(0.9),
        900: this,
      };

  MaterialColor toMaterialColor() => MaterialColor(value, _toSwatch());
  MaterialAccentColor toMaterialAccentColor() => MaterialAccentColor(value, _toSwatch());
}

import 'package:flutter/material.dart';

import 'exception_indicator.dart';

/// Indicates that a connection error occurred.
class NoConnectionIndicator extends StatelessWidget {
  final VoidCallback onTryAgain;

  const NoConnectionIndicator({Key? key, required this.onTryAgain}) : super(key: key);

  @override
  Widget build(BuildContext context) => ExceptionIndicator(
        title: 'No connection',
        message: 'Please check internet connection and try again.',
        assetName: 'assets/frustrated-face.png',
        onTryAgain: onTryAgain,
      );
}

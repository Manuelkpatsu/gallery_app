import 'package:flutter/material.dart';

import 'exception_indicator.dart';

/// Indicates that an unknown error occurred.
class GenericErrorIndicator extends StatelessWidget {
  final VoidCallback onTryAgain;

  const GenericErrorIndicator({Key? key, required this.onTryAgain}) : super(key: key);

  @override
  Widget build(BuildContext context) => ExceptionIndicator(
        title: 'Something went wrong',
        message: 'The application has encountered an unknown error.\n'
            'Please try again later.',
        assetName: 'assets/confused-face.png',
        onTryAgain: onTryAgain,
      );
}

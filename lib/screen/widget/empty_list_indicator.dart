import 'package:flutter/material.dart';

import 'exception_indicator.dart';

/// Indicates that no items were found.
class EmptyListIndicator extends StatelessWidget {
  const EmptyListIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const ExceptionIndicator(
        title: 'No Photos',
        message: 'We couldn\'t find any photos.',
        assetName: 'assets/empty-box.png',
      );
}

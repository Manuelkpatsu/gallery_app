import 'dart:io';

import 'package:flutter/material.dart';

import 'generic_error_indicator.dart';
import 'no_connection_indicator.dart';

/// Based on the received error, displays either a [NoConnectionIndicator] or
/// a [GenericErrorIndicator].
class ErrorIndicator extends StatelessWidget {
  final dynamic error;
  final VoidCallback onTryAgain;

  const ErrorIndicator({Key? key, required this.error, required this.onTryAgain}) : super(key: key);

  @override
  Widget build(BuildContext context) => error is SocketException
      ? NoConnectionIndicator(onTryAgain: onTryAgain)
      : GenericErrorIndicator(onTryAgain: onTryAgain);
}

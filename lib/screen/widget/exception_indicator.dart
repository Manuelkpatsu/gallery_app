import 'package:flutter/material.dart';

/// Basic layout for indicating that an exception occurred.
class ExceptionIndicator extends StatelessWidget {
  final String title;
  final String? message;
  final String assetName;
  final VoidCallback? onTryAgain;

  const ExceptionIndicator({
    Key? key,
    required this.title,
    required this.assetName,
    this.message,
    this.onTryAgain,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
          child: Column(
            children: [
              Image.asset(assetName),
              const SizedBox(height: 32),
              Text(
                title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              if (message != null) const SizedBox(height: 16),
              if (message != null)
                Text(
                  message!,
                  textAlign: TextAlign.center,
                ),
              if (onTryAgain != null) const Spacer(),
              if (onTryAgain != null)
                ElevatedButton.icon(
                  onPressed: onTryAgain,
                  icon: const Icon(Icons.refresh),
                  label: const Text(
                    'Try Again',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
            ],
          ),
        ),
      );
}

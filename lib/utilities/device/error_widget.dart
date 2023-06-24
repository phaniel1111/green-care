import 'package:flutter/material.dart';

class ErrorDetail extends StatelessWidget {
  final String errorMessage;
  final bool isDarkMode;

  const ErrorDetail({super.key, required this.errorMessage, required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    final formattedErrorMessage = errorMessage.replaceAll('Exception: ', '');

    return Center(
      child: Text(
        formattedErrorMessage,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
          color: isDarkMode ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}

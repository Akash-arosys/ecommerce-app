import 'package:flutter/material.dart';

class ConfirmationDialog extends StatelessWidget {
  final String title;
  final String message;
  final VoidCallback? onPressed;

  const ConfirmationDialog({
    super.key,
    required this.message,
    required this.title,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: const Text("No"),
        ),
        ElevatedButton(
          onPressed: onPressed ?? () => Navigator.of(context).pop(true),
          child: const Text("Yes"),
        ),
      ],
    );
  }
}

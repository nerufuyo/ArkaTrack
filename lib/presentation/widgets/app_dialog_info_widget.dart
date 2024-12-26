import 'package:flutter/material.dart';

enum AppDialogInfoType { success, error, warning, info }

class AppDialogInfoWidget extends StatelessWidget {
  const AppDialogInfoWidget({
    super.key,
    required this.type,
    required this.title,
    required this.message,
    this.onTap,
  });

  final AppDialogInfoType type;
  final String title;
  final String message;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(message),
    );
  }
}

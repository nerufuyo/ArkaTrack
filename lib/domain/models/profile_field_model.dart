import 'package:flutter/material.dart';

class ProfileField {
  final String title;
  final TextEditingController controller;
  final String hintText;

  ProfileField({
    required this.title,
    required this.controller,
    required this.hintText,
  });
}

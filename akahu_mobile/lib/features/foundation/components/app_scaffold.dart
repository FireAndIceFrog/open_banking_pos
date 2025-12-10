
import 'package:flutter/material.dart';
import '../app_colors.dart';
import '../app_text.dart';

class AppScaffold extends StatelessWidget {
  final String title;
  final Widget body;

  const AppScaffold({super.key, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title, style: AppText.title.copyWith(color: AppColors.secondary))),
      body: body,
    );
  }
}

import 'package:flutter/material.dart';
import '../app_colors.dart';
import '../app_text.dart';

/// Shared scaffold to enforce consistent theming and layout.
class AppScaffold extends StatelessWidget {
  final String title;
  final Widget body;
  final List<Widget>? actions;
  final Widget? floatingActionButton;

  const AppScaffold({
    super.key,
    required this.title,
    required this.body,
    this.actions,
    this.floatingActionButton,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        title: Text(title, style: AppText.title.copyWith(color: Colors.white)),
        backgroundColor: AppColors.secondary,
        actions: actions,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: body,
        ),
      ),
      floatingActionButton: floatingActionButton,
    );
  }
}

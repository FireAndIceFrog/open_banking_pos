// Shared text styles and small helpers to avoid per-widget styling.
import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppText {
  static TextStyle get title => const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
      );

  static TextStyle get subtitle => const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: AppColors.textSecondary,
      );

  static TextStyle get value => const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
      );
}

class AppCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final double maxWidth;

  const AppCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(16),
    this.maxWidth = 400,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final availableW = constraints.maxWidth;
        final availableH = constraints.maxHeight;
        // Ensure min width of 400px when possible; on small screens, use full width.
        final double minW = availableW >= 400 ? 400 : availableW;
        final double minH = availableH >= 400 ? 400 : availableH; 
        final double maxW = maxWidth;

        return Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(minWidth: minW, maxWidth: maxW, minHeight: minH),
            child: Card(
              child: Padding(
                padding: padding,
                child: child,
              ),
            ),
          ),
        );
      },
    );
  }
}

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

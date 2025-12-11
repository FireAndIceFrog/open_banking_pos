import 'package:flutter/material.dart';
import '../../foundation/app_colors.dart';
import '../../foundation/app_text.dart';

/// Simple placeholder for QR rendering. Replace with real QR widget later.
/// Displays the intentId and a framed box to represent QR code.
class QrView extends StatelessWidget {
  final String intentId;

  const QrView({super.key, required this.intentId});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      decoration: BoxDecoration(
        color: AppColors.tertiary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.tertiary),
      ),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Payment Intent', style: AppText.h2),
          const SizedBox(height: 6),
          Text(intentId, style: AppText.bodySecondary),
          const SizedBox(height: 12),
          Container(
            width: 112,
            height: 112,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.tertiary, width: 2),
              borderRadius: BorderRadius.circular(8),
            ),
            alignment: Alignment.center,
            child: Text('QR', style: AppText.subtitle),
          ),
        ],
      ),
    );
  }
}

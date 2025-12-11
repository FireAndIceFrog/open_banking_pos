import 'package:akahu_mobile/features/payment/models/payment_status/payment_status.dart';
import 'package:flutter/material.dart';
import '../../foundation/app_colors.dart';
import '../../foundation/app_text.dart';

/// Shared status banner used across POS and Make Payment screens.
class StatusBanner extends StatelessWidget {
  final PaymentStatus status;
  final String? reason;

  const StatusBanner({super.key, required this.status, this.reason});

  (Color, Color, String, IconData) _styles(PaymentStatus s) {
    switch (s) {
      case PaymentStatus.SENT:
        return (
          AppColors.success.withOpacity(0.15),
          AppColors.success,
          'Payment successful',
          Icons.check_circle,
        );
      case PaymentStatus.DECLINED:
        return (
          AppColors.error.withOpacity(0.15),
          AppColors.error,
          'Payment declined',
          Icons.error,
        );
      case PaymentStatus.PENDING_APPROVAL:
      default:
        return (
          AppColors.tertiary.withOpacity(0.15),
          AppColors.tertiary,
          'Payment pending',
          Icons.hourglass_top,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final (bg, border, label, icon) = _styles(status);
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: border),
      ),
      child: Row(
        children: [
          Icon(icon, color: border),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: AppText.h2),
                if (reason != null) ...[
                  const SizedBox(height: 4),
                  Text(reason!, style: AppText.bodySecondary),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

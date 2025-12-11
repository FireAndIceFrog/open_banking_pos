import 'package:flutter/material.dart';
import '../../foundation/app_colors.dart';
import '../../foundation/app_text.dart';
import '../services/payment_api_service.dart';

/// Shared status banner used across POS and Make Payment screens.
class StatusBanner extends StatelessWidget {
  final PaymentStatus status;
  final String? reason;

  const StatusBanner({
    super.key,
    required this.status,
    this.reason,
  });

  Color _bg(PaymentStatus s) {
    switch (s) {
      case PaymentStatus.complete:
        return AppColors.success.withOpacity(0.15);
      case PaymentStatus.declined:
        return AppColors.error.withOpacity(0.15);
      case PaymentStatus.pending:
      default:
        return AppColors.tertiary.withOpacity(0.15);
    }
  }

  Color _border(PaymentStatus s) {
    switch (s) {
      case PaymentStatus.complete:
        return AppColors.success;
      case PaymentStatus.declined:
        return AppColors.error;
      case PaymentStatus.pending:
      default:
        return AppColors.tertiary;
    }
  }

  String _label(PaymentStatus s) {
    switch (s) {
      case PaymentStatus.complete:
        return 'Payment successful';
      case PaymentStatus.declined:
        return 'Payment declined';
      case PaymentStatus.pending:
      default:
        return 'Payment pending';
    }
  }

  IconData _icon(PaymentStatus s) {
    switch (s) {
      case PaymentStatus.complete:
        return Icons.check_circle;
      case PaymentStatus.declined:
        return Icons.error;
      case PaymentStatus.pending:
      default:
        return Icons.hourglass_top;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: _bg(status),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: _border(status)),
      ),
      child: Row(
        children: [
          Icon(_icon(status), color: _border(status)),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(_label(status), style: AppText.h2),
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

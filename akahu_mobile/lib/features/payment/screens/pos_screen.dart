import 'package:akahu_mobile/features/payment/utils/format_number.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../foundation/app_text.dart';
import '../../foundation/app_colors.dart';
import '../components/numpad.dart';
import '../components/status_banner.dart';
import '../services/payment_controller.dart';
import 'package:qr_flutter/qr_flutter.dart';

/// POS screen: amount entry via Numpad, Start -> shows QR, polls status.
class PosScreen extends HookConsumerWidget {
  const PosScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final amount = useState<String>('0.00');
    final paymentState = ref.watch(paymentControllerProvider);
    final controller = ref.read(paymentControllerProvider.notifier);

    void appendDigit(String d) {
      final raw = amount.value.replaceAll('.', '');
      final next = raw + d;
      amount.value = formatAmount(next);
    }

    void backspace() {
      final raw = amount.value.replaceAll('.', '');
      if (raw.isEmpty) {
        amount.value = '0.00';
        return;
      }
      final next = raw.substring(0, raw.length - 1);
      amount.value = formatAmount(next);
    }

    void clear() {
      amount.value = '0.00';
    }

    Future<void> start() async {
      final amt = double.tryParse(amount.value.replaceAll('\$', '')) ?? 0.0;
      await controller.create(
        amountCents: (amt * 100).toInt(),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: paymentState.paymentIntent?.intentId == null
          ? [
              Text('Point of Sale', style: AppText.h2),
              const SizedBox(height: 12),
              Text(
                'Enter amount and tap Start to generate a QR for the POS.',
                style: AppText.bodySecondary,
              ),
              const SizedBox(height: 16),

              // Amount display
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 12,
                ),
                decoration: BoxDecoration(
                  color: AppColors.tertiary.withOpacity(0.08),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.tertiary),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Amount', style: AppText.subtitle),
                    Text('\$${amount.value}', style: AppText.value),
                  ],
                ),
              ),

              const SizedBox(height: 12),

              // Numpad input
              Numpad(
                onDigit: appendDigit,
                onBackspace: backspace,
                onClear: clear,
              ),

              const SizedBox(height: 16),

              ElevatedButton(onPressed: start, child: const Text('Start')),
            ]
          : [
              Center(
                child: QrImageView(
                  data: paymentState.paymentIntent!.intentId!,
                  version: QrVersions.auto,
                  size: 220,
                  backgroundColor: Colors.white,
                ),
              ),
              const SizedBox(height: 12),
              if (paymentState.paymentIntent?.status != null)
                StatusBanner(
                  status: paymentState.paymentIntent!.status!,
                  reason: paymentState.paymentIntent!.reason,
                ),
            ],
    );
  }
}

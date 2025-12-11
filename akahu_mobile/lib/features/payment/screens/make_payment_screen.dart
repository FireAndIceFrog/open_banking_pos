import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../foundation/app_text.dart';
import '../../foundation/app_colors.dart';
import '../components/status_banner.dart';
import '../services/payment_api_service.dart';
import '../services/payment_controller.dart';
import '../../accounts/providers/selected_account_provider.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

/// Make Payment screen: scans QR to get intentId, confirms using selected account.
class MakePaymentScreen extends HookConsumerWidget {
  const MakePaymentScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scannedIntentId = useState<String?>(null);
    final paymentState = ref.watch(paymentControllerProvider);
    final controller = ref.read(paymentControllerProvider.notifier);
    final selectedAccount = ref.watch(selectedAccountProvider);

    void _onScan(String code) {
      scannedIntentId.value = code;
      controller.setScannedIntent(code);
    }

    Future<void> _confirm() async {
      if (scannedIntentId.value == null) return;
      if (selectedAccount == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Select an account first from Accounts')),
        );
        return;
      }
      final fromUserId = selectedAccount.id; // use selected account id for confirm
      await controller.confirm(fromUserId: fromUserId);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('Make Payment', style: AppText.h2),
        const SizedBox(height: 12),
        Text('Scan QR to read the payment intent, then confirm from your account.', style: AppText.bodySecondary),
        const SizedBox(height: 24),

        // QR scanner using mobile_scanner
        SizedBox(
          height: 220,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Stack(
              children: [
                MobileScanner(
                  controller: MobileScannerController(
                    detectionSpeed: DetectionSpeed.normal,
                    facing: CameraFacing.back,
                  ),
                  onDetect: (capture) {
                    final barcodes = capture.barcodes;
                    if (barcodes.isEmpty) return;
                    final raw = barcodes.first.rawValue;
                    if (raw == null || raw.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Invalid QR')),
                      );
                      return;
                    }
                    _onScan(raw);
                  },
                ),
                Positioned(
                  left: 12,
                  right: 12,
                  bottom: 12,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      paymentState.intentId != null
                          ? 'Intent: ${paymentState.intentId!}'
                          : 'Align QR within the frame',
                      style: AppText.body.copyWith(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 16),

        ElevatedButton(
          onPressed: scannedIntentId.value != null ? _confirm : null,
          child: const Text('Confirm Payment'),
        ),

        const SizedBox(height: 16),

        if (paymentState.status != null)
          StatusBanner(status: paymentState.status!, reason: paymentState.reason),
      ],
    );
  }
}

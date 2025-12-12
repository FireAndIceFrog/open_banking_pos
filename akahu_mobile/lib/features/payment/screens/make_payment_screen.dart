import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../foundation/app_text.dart';
import '../components/status_banner.dart';
import '../services/payment_controller.dart';
import '../../accounts/providers/selected_account_provider.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'dart:io' show Platform;

/// Make Payment screen: scans QR to get intentId, confirms using selected account.
class MakePaymentScreen extends HookConsumerWidget {
  const MakePaymentScreen({super.key});
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final paymentState = ref.watch(paymentControllerProvider);
    final controller = ref.read(paymentControllerProvider.notifier);
    final selectedAccount = ref.watch(selectedAccountProvider);

    void onScan(String code) {
      controller.setScannedIntent(code);
    }

    Future<void> confirm() async {
      if (selectedAccount == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Select an account first from Accounts')),
        );
        return;
      }
      await controller.confirm();
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
                if(Platform.isWindows || Platform.isLinux || Platform.isMacOS)
                  Center(
                    child: Text(
                      'QR Scanner not supported on desktop platforms.',
                      style: AppText.bodySecondary,
                      textAlign: TextAlign.center,
                    ),
                  )
                else
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
                    onScan(raw);
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
                      paymentState.paymentIntent?.intentId != null
                          ? 'Intent: ${paymentState.paymentIntent!.intentId!}'
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
          onPressed: paymentState.paymentIntent?.intentId != null ? confirm : null,
          child: const Text('Confirm Payment'),
        ),

        const SizedBox(height: 16),

        if (paymentState.paymentIntent?.status != null)
          StatusBanner(status: paymentState.paymentIntent!.status!, reason: paymentState.paymentIntent!.reason),
      ],
    );
  }
}

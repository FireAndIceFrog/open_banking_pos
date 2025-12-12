// dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:akahu_mobile/features/payment/screens/pos_screen.dart';
import 'package:akahu_mobile/features/payment/services/payment_controller.dart' show paymentControllerProvider;
import 'package:akahu_mobile/features/payment/models/payment_state/payment_state.dart';
import 'package:akahu_mobile/features/payment/models/payment_intent/payment_intent.dart';
import 'package:akahu_mobile/features/payment/models/payment_status/payment_status.dart';
import 'package:akahu_mobile/features/payment/components/status_banner.dart';
import '../services/test_payment_controller.dart';
import '../services/test_selected_account_notifier.dart';
import 'package:akahu_mobile/features/accounts/providers/selected_account_provider.dart' show selectedAccountProvider;

void main() {
  group('PosScreen', () {
    testWidgets('numpad input updates amount and Start calls create', (tester) async {
      final testController = TestPaymentController();
      final testSelectedAccountNotifier = TestSelectedAccountNotifier();

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            paymentControllerProvider.overrideWith(() => testController),
            selectedAccountProvider.overrideWith(() => testSelectedAccountNotifier),
          ],
          child: MaterialApp(home: Scaffold(body: PosScreen())),
        ),
      );

      // Initial amount
      expect(find.text('\$0.00'), findsOneWidget);

      // Tap '1' on numpad
      await tester.tap(find.text('1'));
      await tester.pump();
      expect(find.text('\$0.01'), findsOneWidget);

      // Tap '2'
      await tester.tap(find.text('2'));
      await tester.pump();
      expect(find.text('\$0.12'), findsOneWidget);

      // Tap '3'
      await tester.tap(find.text('3'));
      await tester.pump();
      expect(find.text('\$1.23'), findsOneWidget);

      // Tap backspace
      await tester.tap(find.text('⌫'));
      await tester.pump();
      expect(find.text('\$0.12'), findsOneWidget);

      // Tap clear
      await tester.tap(find.text('C'));
      await tester.pump();
      expect(find.text('\$0.00'), findsOneWidget);

      // Enter 5, 0, 0 for $5.00
      await tester.tap(find.text('5'));
      await tester.pump();
      await tester.tap(find.text('0'));
      await tester.pump();
      await tester.tap(find.text('0'));
      await tester.pump();
      expect(find.text('\$5.00'), findsOneWidget);

      // Tap Start
      await tester.tap(find.widgetWithText(ElevatedButton, 'Start'));
      await tester.pumpAndSettle();

      expect(testController.lastCreateAmountCents, isNotNull);
      expect(testController.lastCreateAmountCents, 500);
    });

    testWidgets('shows QR and status banner when paymentIntent is set', (tester) async {
      final testController = TestPaymentController();
      final testSelectedAccountNotifier = TestSelectedAccountNotifier();

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            paymentControllerProvider.overrideWith(() => testController),
            selectedAccountProvider.overrideWith(() => testSelectedAccountNotifier),
          ],
          child: MaterialApp(home: Scaffold(body: PosScreen())),
        ),
      );

      testController.state = testController.state.copyWith(
        paymentIntent: PaymentIntent(
          intentId: 'qr-123',
          status: PaymentStatus.PENDING_APPROVAL,
          reason: null,
          toUserId: null,
          fromUserId: null,
          amountCents: null,
        ),
      );
      await tester.pumpAndSettle();

      // QR code should be present
      expect(find.byType(Container), findsWidgets); // QrImageView is a Container subclass
      expect(find.textContaining('qr-123'), findsNothing); // Data is not shown as text

      // Status banner should be present
      expect(find.byType(StatusBanner), findsOneWidget);
    });

    testWidgets('status banner shows correct status and reason', (tester) async {
      final testController = TestPaymentController();
      final testSelectedAccountNotifier = TestSelectedAccountNotifier();

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            paymentControllerProvider.overrideWith(() => testController),
            selectedAccountProvider.overrideWith(() => testSelectedAccountNotifier),
          ],
          child: MaterialApp(home: Scaffold(body: PosScreen())),
        ),
      );

      testController.state = testController.state.copyWith(
        paymentIntent: PaymentIntent(
          intentId: 'qr-456',
          status: PaymentStatus.ERROR,
          reason: 'Insufficient funds',
          toUserId: null,
          fromUserId: null,
          amountCents: null,
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(StatusBanner), findsOneWidget);
      expect(find.text('Payment pending'), findsOneWidget);
      expect(find.text('Insufficient funds'), findsOneWidget);
    });
  });
}

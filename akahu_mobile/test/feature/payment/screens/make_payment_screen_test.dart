// dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:akahu_mobile/features/payment/screens/make_payment_screen.dart';
import 'package:akahu_mobile/features/payment/services/payment_controller.dart' show paymentControllerProvider;
import 'package:akahu_mobile/features/accounts/providers/selected_account_provider.dart' show SelectedAccountNotifier, selectedAccountProvider;
import 'package:akahu_mobile/features/accounts/models/account/account.dart';

import '../services/test_payment_controller.dart';
import '../services/test_selected_account_notifier.dart';

void main() {
  group('MakePaymentScreen', () {
    testWidgets('onScan shows intent and confirm calls controller when account selected', (tester) async {
      final testController = TestPaymentController();
      final testSelectedAccountNotifier = TestSelectedAccountNotifier();

      // create a simple account instance used as selected account
      final account = Account(
        id: 'id-1',
        name: 'Primary',
        number: '123456',
        accountHolderName: 'Test User',
        type: 'CHECKING',
        institution: 'Bank',
        balance: const Balance(currency: 'NZD', current: 1000, overdrawn: false),
      );

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            paymentControllerProvider.overrideWith(() => testController),
            selectedAccountProvider.overrideWith(() => testSelectedAccountNotifier),
          ],
          child: MaterialApp(home: Scaffold(body: MakePaymentScreen())),
        ),
      );

      testSelectedAccountNotifier.setAccount(account);
      await tester.pumpAndSettle();

      // Simulate a scan by directly calling test controller helper
      testController.setScannedIntent('intent123');
      await tester.pumpAndSettle();

      expect(find.text('Intent: intent123'), findsOneWidget);

      final confirmFinder = find.widgetWithText(ElevatedButton, 'Confirm Payment');
      expect(confirmFinder, findsOneWidget);

      // Button should be enabled
      final confirmButton = tester.widget<ElevatedButton>(confirmFinder);
      expect(confirmButton.onPressed != null, isTrue);

      await tester.tap(confirmFinder);
      await tester.pumpAndSettle();

      expect(testController.confirmCalled, isTrue);
    });

    testWidgets('confirm shows snackbar when no account selected and does not call confirm', (tester) async {
      final testController = TestPaymentController();
      final testSelectedAccountNotifier = TestSelectedAccountNotifier();

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            paymentControllerProvider.overrideWith(() => testController),
            selectedAccountProvider.overrideWith(() => testSelectedAccountNotifier),
          ],
          child: MaterialApp(home: Scaffold(body: MakePaymentScreen())),
        ),
      );

      testController.setScannedIntent('intent123');
      await tester.pumpAndSettle();

      final confirmFinder = find.widgetWithText(ElevatedButton, 'Confirm Payment');
      expect(confirmFinder, findsOneWidget);

      // Tap confirm -> should show SnackBar and not call confirm on controller
      await tester.tap(confirmFinder);
      await tester.pumpAndSettle();

      expect(find.text('Select an account first from Accounts'), findsOneWidget);
      expect(testController.confirmCalled, isFalse);
    });
  });
}

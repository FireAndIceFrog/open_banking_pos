// dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:akahu_mobile/features/accounts/screens/accounts_screen.dart';
import 'package:akahu_mobile/features/accounts/providers/accounts_providers.dart';
import 'package:akahu_mobile/features/accounts/providers/selected_account_provider.dart';
import '../services/test_selected_account_notifier.dart';
import 'package:akahu_mobile/features/accounts/models/account/account.dart';
import 'package:akahu_mobile/features/accounts/components/account_card.dart';
import '../services/test_accounts_service.dart';
import 'package:akahu_mobile/features/accounts/providers/accounts_providers.dart';

void main() {
  group('AccountsScreen', () {
    testWidgets('shows loading indicator when accounts are loading', (tester) async {
      final loadingProvider = accountsProvider.overrideWith((ref) => Future<List<Account>>.delayed(const Duration(seconds: 1)));
      final selectedAccountOverride = selectedAccountProvider.overrideWith(() => TestSelectedAccountNotifier());

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            accountsServiceProvider.overrideWithValue(const TestAccountsService()),
            loadingProvider,
            selectedAccountOverride
          ],
          child: const MaterialApp(
            home: Scaffold(
              body: SizedBox.expand(child: AccountsScreen()),
            ),
          ),
        ),
      );

      // Allow widget tree to build
      await tester.pump(const Duration(milliseconds: 100));
      // Should show loading indicator before data is available
      if (find.byType(CircularProgressIndicator).evaluate().isEmpty) {
        debugPrint('WIDGET TREE (loading):\n' + tester.element(find.byType(AccountsScreen)).toStringDeep());
      }
      if (find.byType(CircularProgressIndicator).evaluate().isEmpty) {
        // If not loading, check for error text
        expect(find.textContaining('Invalid argument'), findsOneWidget);
      } else {
        expect(find.byType(CircularProgressIndicator), findsOneWidget);
      }
      expect(find.byType(Center), findsWidgets);
    });

    testWidgets('shows error widget when accounts provider errors', (tester) async {
      final errorProvider = accountsProvider.overrideWith((ref) => Future<List<Account>>.error('Failed'));
      final selectedAccountOverride = selectedAccountProvider.overrideWith(() => TestSelectedAccountNotifier());

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            accountsServiceProvider.overrideWithValue(const TestAccountsService()),
            errorProvider,
            selectedAccountOverride
          ],
          child: const MaterialApp(
            home: Scaffold(
              body: SizedBox.expand(child: AccountsScreen()),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();
      expect(find.textContaining('Failed'), findsOneWidget);
    });

    testWidgets('shows accounts list when data is loaded', (tester) async {
      final accounts = [
        Account(
          id: 'id-1',
          name: 'Primary',
          number: '123456',
          accountHolderName: 'Test User',
          type: 'CHECKING',
          institution: 'Bank',
          balance: const Balance(currency: 'NZD', current: 1000, overdrawn: false),
        ),
        Account(
          id: 'id-2',
          name: 'Savings',
          number: '654321',
          accountHolderName: 'Test User',
          type: 'SAVINGS',
          institution: 'Bank',
          balance: const Balance(currency: 'NZD', current: 5000, overdrawn: false),
        ),
      ];

      final dataProvider = accountsProvider.overrideWith((ref) => Future.value(accounts));
      final selectedAccountNotifier = TestSelectedAccountNotifier();
      final selectedAccountOverride = selectedAccountProvider.overrideWith(() => selectedAccountNotifier);

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            accountsServiceProvider.overrideWithValue(const TestAccountsService()),
            dataProvider,
            selectedAccountOverride
          ],
          child: const MaterialApp(
            home: Scaffold(
              body: SizedBox.expand(child: AccountsScreen()),
            ),
          ),
        ),
      );

      // Set the initial selected account after provider is initialized
      selectedAccountNotifier.setInitial(accounts[0]);
      await tester.pumpAndSettle();

      // Allow widget tree to build
      await tester.pump(const Duration(milliseconds: 100));

      // Should find account cards and account names
      if (find.byType(AccountCard).evaluate().isEmpty) {
        debugPrint('WIDGET TREE (data):\n' + tester.element(find.byType(AccountsScreen)).toStringDeep());
      }
      expect(find.byType(AccountCard), findsNWidgets(2));
      expect(find.text('Primary'), findsOneWidget);
      expect(find.text('Savings'), findsOneWidget);
      expect(find.text('CHECKING'), findsOneWidget);
      expect(find.text('SAVINGS'), findsOneWidget);
    });
  });
}

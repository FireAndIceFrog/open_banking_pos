import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/accounts_providers.dart';
import '../providers/selected_account_provider.dart';
import '../../foundation/app_text.dart';
import '../../foundation/app_colors.dart';
import '../components/account_card.dart';
import 'package:go_router/go_router.dart';
import '../../foundation/routes/router.dart';

class AccountsScreen extends HookConsumerWidget {
  const AccountsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accountsAsync = ref.watch(accountsProvider);
    final selectedAccount = ref.watch(selectedAccountProvider);

    return accountsAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) => Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Text(
            'Failed to load accounts',
            style: AppText.subtitle.copyWith(color: Colors.red),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      data: (accounts) {
        if (accounts.isEmpty) {
          return Center(
            child: Text(
              'No accounts found',
              style: AppText.subtitle.copyWith(color: AppColors.textSecondary),
            ),
          );
        }
        return Column(
          children: [
            if (selectedAccount == null)
              Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  'Select an account to start a payment.',
                  style: AppText.bodySecondary,
                ),
              )
            else
              Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  'Selected: ${selectedAccount.name}',
                  style: AppText.subtitle,
                ),
              ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 8),
                itemCount: accounts.length,
                itemBuilder: (context, index) {
                  final account = accounts[index];
                  return InkWell(
                    onTap: () => ref.read(selectedAccountProvider.notifier).set(account),
                    child: AccountCard(account: account),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: selectedAccount == null
                          ? null
                          : () {
                              context.push(RoutePaths.paymentsPos);
                            },
                      child: const Text('Start POS'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: selectedAccount == null
                          ? null
                          : () {
                              context.push(RoutePaths.paymentsMake);
                            },
                      child: const Text('Make Payment'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

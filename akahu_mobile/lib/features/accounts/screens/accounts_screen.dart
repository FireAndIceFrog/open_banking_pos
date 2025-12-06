import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/accounts_providers.dart';
import '../../foundation/app_text.dart';
import '../../foundation/app_colors.dart';
import '../components/account_card.dart';

class AccountsScreen extends HookConsumerWidget {
  const AccountsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accountsAsync = ref.watch(accountsProvider);

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
        return ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 8),
          itemCount: accounts.length,
          itemBuilder: (context, index) {
            final account = accounts[index];
            return AccountCard(account: account);
          },
        );
      },
    );
  }
}

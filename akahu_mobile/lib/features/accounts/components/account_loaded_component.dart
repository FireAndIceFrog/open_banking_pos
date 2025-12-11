import 'package:akahu_mobile/features/accounts/components/account_card.dart';
import 'package:akahu_mobile/features/accounts/models/account/account.dart';
import 'package:akahu_mobile/features/accounts/providers/selected_account_provider.dart';
import 'package:akahu_mobile/features/foundation/app_colors.dart';
import 'package:akahu_mobile/features/foundation/app_text.dart';
import 'package:akahu_mobile/features/foundation/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AccountLoadedComponent extends HookConsumerWidget {
  final List<Account> accounts;
  final Account? selectedAccount;

  const AccountLoadedComponent({
    super.key,
    required this.accounts,
    this.selectedAccount,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
              'Selected: ${selectedAccount?.name}',
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
                onTap: () =>
                    ref.read(selectedAccountProvider.notifier).set(account),
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
  }
}

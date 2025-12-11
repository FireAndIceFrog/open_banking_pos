import 'package:akahu_mobile/features/accounts/models/account/account.dart';
import 'package:flutter/material.dart';
import '../../foundation/app_text.dart';
import '../../foundation/app_colors.dart';
import '../../foundation/components/app_card.dart';

class AccountCard extends StatelessWidget {
  final Account account;

  const AccountCard({super.key, required this.account});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(account.name!, style: AppText.title),
          const SizedBox(height: 4),
          Text(account.type!, style: AppText.subtitle),
          const SizedBox(height: 8),
          Text(
            _formatAmount(account.balance!.currency, account.balance!.current),
            style: AppText.value.copyWith(color: AppColors.secondary),
          ),
        ],
      ),
    );
  }

  String _formatAmount(String currency, num amount) {
    // Simple display; can be replaced with intl later.
    return '$currency ${amount.toStringAsFixed(2)}';
  }
}

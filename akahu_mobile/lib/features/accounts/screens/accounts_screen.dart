import 'package:akahu_mobile/features/accounts/components/account_loaded_component.dart';
import 'package:akahu_mobile/features/foundation/components/async_snapshot.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/accounts_providers.dart';
import '../providers/selected_account_provider.dart';

class AccountsScreen extends HookConsumerWidget {
  const AccountsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accountsAsync = ref.watch(accountsProvider);
    final selectedAccount = ref.watch(selectedAccountProvider);

    final defaultAccountFuture = useFuture(useMemoized(
      () => ref.read(selectedAccountProvider.notifier).get(),
      []
    ));

    final loadingOrErrorPage =
        accountsAsync.load() ?? defaultAccountFuture.load();

    if (loadingOrErrorPage != null) {
      return loadingOrErrorPage;
    }

    return AccountLoadedComponent(
      accounts: accountsAsync.asData!.value,
      selectedAccount: selectedAccount,
    );
  }
}

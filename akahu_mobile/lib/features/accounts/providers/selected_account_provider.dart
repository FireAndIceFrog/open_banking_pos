import 'package:akahu_mobile/features/accounts/models/account/account.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SelectedAccountNotifier extends Notifier<Account?> {
  @override
  Account? build() => null;

  void set(Account? account) {
    state = account;
  }

  Account? get() {
    if (state == null) {
      return null;
    }

    return state;
  }

  void clear() {
    state = null;
  }
}

/// Currently selected account (used for payments)
final selectedAccountProvider =
    NotifierProvider<SelectedAccountNotifier, Account?>(() {
  return SelectedAccountNotifier();
});

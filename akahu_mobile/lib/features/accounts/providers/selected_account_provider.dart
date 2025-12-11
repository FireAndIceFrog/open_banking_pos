import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../types/account.dart';

class SelectedAccountNotifier extends Notifier<Account?> {
  @override
  Account? build() => null;

  void set(Account? account) {
    state = account;
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

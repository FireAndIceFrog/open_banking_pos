// dart
import 'package:akahu_mobile/features/accounts/models/account/account.dart';
import 'package:akahu_mobile/features/accounts/providers/selected_account_provider.dart';

class TestSelectedAccountNotifier extends SelectedAccountNotifier {
  TestSelectedAccountNotifier();

  @override
  Future<Account?> get() async {
    // In tests, just return the current state or the first account if available
    if (state != null) return state;
    if (accounts.isNotEmpty) {
      state = accounts.first;
      return state;
    }
    return null;
  }

  void setInitial(Account? account) {
    state = account;
  }

  void setAccount(Account? account) {
    state = account;
  }
}

// dart
import 'package:akahu_mobile/features/accounts/models/account/account.dart';
import 'package:akahu_mobile/features/accounts/providers/selected_account_provider.dart';

/// Test double for SelectedAccountNotifier that avoids runtime dependencies.
/// Use the helper `selectedAccountOverride(account)` to create a ProviderOverride
/// you can pass into ProviderScope.overrides.
class TestSelectedAccountNotifier extends SelectedAccountNotifier {
  @override
  Account? build() {
    // Do not call super to avoid depending on accountsProvider/accountsService.
    return null;
  }

  /// Helper to set the selected account in tests.
  void setAccount(Account? account) {
    state = account;
  }
}
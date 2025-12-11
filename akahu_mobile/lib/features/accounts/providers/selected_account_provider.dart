import 'package:akahu_mobile/features/accounts/models/account/account.dart';
import 'package:akahu_mobile/features/accounts/services/accounts_service.dart';
import 'package:akahu_mobile/features/foundation/exceptions/http_status_exception.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../providers/accounts_providers.dart';

class SelectedAccountNotifier extends Notifier<Account?> {
  List<Account?> accounts = [];
  late AccountsService accountsService;

  SelectedAccountNotifier();

  @override
  Account? build() {
    accountsService = ref.watch(accountsServiceProvider);
    final currentAccounts = ref.watch(accountsProvider);
    final currentAccountsValue = currentAccounts.asData?.value;

    if (currentAccountsValue != null) {
      accounts = currentAccountsValue;
    }

    return null;
  }

  Future<Account?> get() async {
    if (state != null) {
      return state;
    }
    var defaultAccountNum = '';
    try {
      defaultAccountNum = await accountsService.getDefaultAccountNum();
    } on HttpStatusException catch (ex) {
      if (ex.statusCode == 404) {
        return null;
      }

      rethrow;
    }
    if (defaultAccountNum.isEmpty) {
      return null;
    }

    
    state = accounts.firstWhere(
      (account) => account?.number == defaultAccountNum
    );
    return state;
  }

  Future<void> set(Account? account) async {
    if (account != null) {
      await accountsService.setDefaultPaymentAccount(account.number!);
    }
    state = account;
  }

  void clear() {
    state = null;
  }
}

/// Currently selected account (used for payments)
final selectedAccountProvider =
    NotifierProvider.autoDispose<SelectedAccountNotifier, Account?>(() {
      return SelectedAccountNotifier();
    }, dependencies: [accountsProvider]);

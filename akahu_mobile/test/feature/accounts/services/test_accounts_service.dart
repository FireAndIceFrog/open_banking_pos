// dart
import 'package:akahu_mobile/features/accounts/models/account/account.dart';
import 'package:akahu_mobile/features/accounts/services/accounts_service.dart';

class TestAccountsService implements AccountsService {
  const TestAccountsService();

  @override
  Future<List<Account>> fetchAccounts() async {
    return [];
  }

  @override
  Future<String> getDefaultAccountNum() async {
    return '123456';
  }

  @override
  Future<void> setDefaultPaymentAccount(String accountNum) async {}

  // Add any other methods as needed for the interface
}

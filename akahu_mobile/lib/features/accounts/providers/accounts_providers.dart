import 'package:akahu_mobile/features/accounts/models/account/account.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../services/accounts_service.dart';

final accountsServiceProvider = Provider<AccountsService>((ref) {
  return const AccountsService();
});

final accountsProvider = FutureProvider<List<Account>>((ref) async {
  final service = ref.watch(accountsServiceProvider);
  return service.fetchAccounts();
});

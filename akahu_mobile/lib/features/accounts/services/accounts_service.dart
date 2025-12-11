import 'dart:convert';
import 'package:akahu_mobile/features/accounts/const/api_routes.dart';
import 'package:akahu_mobile/features/accounts/models/account/account.dart';
import 'package:akahu_mobile/features/foundation/models/response_extension/response_extension.dart';
import 'package:http/http.dart' as http;
import '../../foundation/consts/env.dart';

class AccountsService {
  const AccountsService();

  Future<List<Account>> fetchAccounts() async {
    final uri = AppEnv.api(AccountApiRoutes.getAccounts);
    final res = await http.get(uri, headers: {'Accept': 'application/json'});

    return res.tryGetData<List<Account>>(
          (List<Map<String, dynamic>> x) =>
              x.map((e) => Account.fromJson(e)).toList(),
        ) ??
        [];
  }
}

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../foundation/consts/env.dart';
import '../types/account.dart';

class AccountsService {
  const AccountsService();

  Future<List<Account>> fetchAccounts() async {
    final uri = AppEnv.api('/api/v1/accounts');
    final res = await http.get(uri, headers: {
      'Accept': 'application/json',
    });

    if (res.statusCode >= 200 && res.statusCode < 300) {
      final data = json.decode(res.body) as List<dynamic>;
      return data.map((e) => Account.fromJson(e as Map<String, dynamic>)).toList();
    }

    throw http.ClientException('Failed to load accounts (${res.statusCode})', uri);
  }
}

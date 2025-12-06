import 'package:flutter/foundation.dart';

@immutable
class Balance {
  final String currency;
  final num current;
  final bool overdrawn;

  const Balance({
    required this.currency,
    required this.current,
    required this.overdrawn,
  });

  factory Balance.fromJson(Map<String, dynamic> json) {
    return Balance(
      currency: json['currency'] as String? ?? 'NZD',
      current: (json['current'] as num?) ?? 0,
      overdrawn: json['overdrawn'] as bool? ?? false,
    );
  }
}

@immutable
class Account {
  final String id;
  final String name;
  final String number;
  final String accountHolderName;
  final String type;
  final String institution;
  final Balance balance;

  const Account({
    required this.id,
    required this.name,
    required this.number,
    required this.accountHolderName,
    required this.type,
    required this.institution,
    required this.balance,
  });

  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(
      id: json['_id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      number: json['number'] as String? ?? '',
      accountHolderName: json['accountHolderName'] as String? ?? 'N/A',
      type: json['type'] as String? ?? '',
      institution: json['institution'] as String? ?? '',
      balance: Balance.fromJson(json['balance'] as Map<String, dynamic>? ?? const {
        'currency': 'NZD',
        'current': 0,
        'overdrawn': false,
      }),
    );
  }
}

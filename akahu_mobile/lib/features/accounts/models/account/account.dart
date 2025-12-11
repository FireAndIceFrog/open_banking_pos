import 'package:freezed_annotation/freezed_annotation.dart';

part 'account.freezed.dart';
part 'account.g.dart';

@freezed
class Balance with _$Balance {
  const factory Balance({
    @JsonKey(name: 'currency') required String currency,
    @JsonKey(name: 'current') required num current,
    @JsonKey(name: 'overdrawn') required bool overdrawn,
  }) = _Balance;

  factory Balance.fromJson(Map<String, dynamic> json) => _$BalanceFromJson(json);
}

@freezed
class Account with _$Account {
  const factory Account({
    @JsonKey(name: '_id') required String? id,
    @JsonKey(name: 'name') required String? name,
    @JsonKey(name: 'number') required String? number,
    @JsonKey(name: 'accountHolderName') required String? accountHolderName,
    @JsonKey(name: 'type') required String? type,
    @JsonKey(name: 'institution') required String? institution,
    @JsonKey(name: 'balance') required Balance? balance,
  }) = _Account;

  factory Account.fromJson(Map<String, dynamic> json) => _$AccountFromJson(json);
}

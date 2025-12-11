// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BalanceImpl _$$BalanceImplFromJson(Map<String, dynamic> json) =>
    _$BalanceImpl(
      currency: json['currency'] as String,
      current: json['current'] as num,
      overdrawn: json['overdrawn'] as bool,
    );

Map<String, dynamic> _$$BalanceImplToJson(_$BalanceImpl instance) =>
    <String, dynamic>{
      'currency': instance.currency,
      'current': instance.current,
      'overdrawn': instance.overdrawn,
    };

_$AccountImpl _$$AccountImplFromJson(Map<String, dynamic> json) =>
    _$AccountImpl(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      number: json['number'] as String?,
      accountHolderName: json['accountHolderName'] as String?,
      type: json['type'] as String?,
      institution: json['institution'] as String?,
      balance: json['balance'] == null
          ? null
          : Balance.fromJson(json['balance'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AccountImplToJson(_$AccountImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'number': instance.number,
      'accountHolderName': instance.accountHolderName,
      'type': instance.type,
      'institution': instance.institution,
      'balance': instance.balance,
    };

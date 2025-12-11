// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_intent.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaymentIntentImpl _$$PaymentIntentImplFromJson(Map<String, dynamic> json) =>
    _$PaymentIntentImpl(
      intentId: json['intentId'] as String,
      toAccountId: json['toAccountId'] as String,
      amount: (json['amount'] as num).toDouble(),
      status: PaymentStatus.fromJson(json['status'] as String),
      reason: json['reason'] as String?,
    );

Map<String, dynamic> _$$PaymentIntentImplToJson(_$PaymentIntentImpl instance) =>
    <String, dynamic>{
      'intentId': instance.intentId,
      'toAccountId': instance.toAccountId,
      'amount': instance.amount,
      'status': instance.status,
      'reason': instance.reason,
    };

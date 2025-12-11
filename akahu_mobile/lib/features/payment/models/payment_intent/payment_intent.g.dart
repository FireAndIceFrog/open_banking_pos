// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_intent.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaymentIntentImpl _$$PaymentIntentImplFromJson(Map<String, dynamic> json) =>
    _$PaymentIntentImpl(
      intentId: json['intentId'] as String?,
      toUserId: json['toUserId'] as String?,
      fromUserId: json['fromUserId'] as String?,
      amountCents: (json['amountCents'] as num?)?.toInt(),
      status: json['status'] == null
          ? null
          : PaymentStatus.fromJson(json['status'] as String),
      reason: json['reason'] as String?,
    );

Map<String, dynamic> _$$PaymentIntentImplToJson(_$PaymentIntentImpl instance) =>
    <String, dynamic>{
      'intentId': instance.intentId,
      'toUserId': instance.toUserId,
      'fromUserId': instance.fromUserId,
      'amountCents': instance.amountCents,
      'status': instance.status,
      'reason': instance.reason,
    };

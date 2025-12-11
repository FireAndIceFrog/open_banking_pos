import 'package:freezed_annotation/freezed_annotation.dart';
import '../payment_status/payment_status.dart';

part 'payment_intent.freezed.dart';
part 'payment_intent.g.dart';

/// PaymentIntent model aligned with Akahu.
/// Encodes/decodes JSON and provides copyWith via Freezed.
@freezed
class PaymentIntent with _$PaymentIntent {
  const factory PaymentIntent({
    @JsonKey(name: 'intentId') required String intentId,
    @JsonKey(name: 'toAccountId') required String toAccountId,
    @JsonKey(name: 'amount') required double amount,
    @JsonKey(name: 'status') required PaymentStatus status,
    @JsonKey(name: 'reason') String? reason,
  }) = _PaymentIntent;

  factory PaymentIntent.fromJson(Map<String, dynamic> json) => _$PaymentIntentFromJson(json);
}

import 'package:freezed_annotation/freezed_annotation.dart';
import '../payment_status/payment_status.dart';

part 'payment_intent.freezed.dart';
part 'payment_intent.g.dart';

/// PaymentIntent model aligned with Akahu.
/// Encodes/decodes JSON and provides copyWith via Freezed.
@freezed
class PaymentIntent with _$PaymentIntent {
  const factory PaymentIntent({
    @JsonKey(name: 'intentId') required String? intentId,
    @JsonKey(name: 'toUserId') required String? toUserId,
    @JsonKey(name: 'fromUserId') required String? fromUserId,
    @JsonKey(name: 'amountCents') required int? amountCents,
    @JsonKey(name: 'status') required PaymentStatus? status,
    @JsonKey(name: 'reason') String? reason,
  }) = _PaymentIntent;

  factory PaymentIntent.fromJson(Map<String, dynamic> json) => _$PaymentIntentFromJson(json);
}
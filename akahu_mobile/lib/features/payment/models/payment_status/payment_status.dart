import 'package:json_annotation/json_annotation.dart';

part 'payment_status.g.dart';

@JsonEnum(alwaysCreate: true)
enum PaymentStatus {
  @JsonValue('READY')
  READY('READY'),
  @JsonValue('PENDING_APPROVAL')
  PENDING_APPROVAL('PENDING_APPROVAL'),
  @JsonValue('PAUSED')
  PAUSED('PAUSED'),
  @JsonValue('SENT')
  SENT('SENT'),
  @JsonValue('DECLINED')
  DECLINED('DECLINED'),
  @JsonValue('ERROR')
  ERROR('ERROR'),
  @JsonValue('CANCELLED')
  CANCELLED('CANCELLED');

  final String value;
  const PaymentStatus(this.value);

  factory PaymentStatus.fromJson(String value) =>
      _$PaymentStatusEnumMap.entries
          .firstWhere(
            (element) => element.value == value,
            orElse: () => MapEntry(PaymentStatus.ERROR, 'ERROR'),
          )
          .key;

  String toJson() => _$PaymentStatusEnumMap[this]!;
}

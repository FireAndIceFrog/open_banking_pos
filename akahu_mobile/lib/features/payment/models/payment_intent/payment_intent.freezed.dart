// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_intent.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

PaymentIntent _$PaymentIntentFromJson(Map<String, dynamic> json) {
  return _PaymentIntent.fromJson(json);
}

/// @nodoc
mixin _$PaymentIntent {
  @JsonKey(name: 'intentId')
  String? get intentId => throw _privateConstructorUsedError;
  @JsonKey(name: 'toUserId')
  String? get toUserId => throw _privateConstructorUsedError;
  @JsonKey(name: 'fromUserId')
  String? get fromUserId => throw _privateConstructorUsedError;
  @JsonKey(name: 'amountCents')
  int? get amountCents => throw _privateConstructorUsedError;
  @JsonKey(name: 'status')
  PaymentStatus? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'reason')
  String? get reason => throw _privateConstructorUsedError;

  /// Serializes this PaymentIntent to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaymentIntent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaymentIntentCopyWith<PaymentIntent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentIntentCopyWith<$Res> {
  factory $PaymentIntentCopyWith(
    PaymentIntent value,
    $Res Function(PaymentIntent) then,
  ) = _$PaymentIntentCopyWithImpl<$Res, PaymentIntent>;
  @useResult
  $Res call({
    @JsonKey(name: 'intentId') String? intentId,
    @JsonKey(name: 'toUserId') String? toUserId,
    @JsonKey(name: 'fromUserId') String? fromUserId,
    @JsonKey(name: 'amountCents') int? amountCents,
    @JsonKey(name: 'status') PaymentStatus? status,
    @JsonKey(name: 'reason') String? reason,
  });
}

/// @nodoc
class _$PaymentIntentCopyWithImpl<$Res, $Val extends PaymentIntent>
    implements $PaymentIntentCopyWith<$Res> {
  _$PaymentIntentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaymentIntent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? intentId = freezed,
    Object? toUserId = freezed,
    Object? fromUserId = freezed,
    Object? amountCents = freezed,
    Object? status = freezed,
    Object? reason = freezed,
  }) {
    return _then(
      _value.copyWith(
            intentId: freezed == intentId
                ? _value.intentId
                : intentId // ignore: cast_nullable_to_non_nullable
                      as String?,
            toUserId: freezed == toUserId
                ? _value.toUserId
                : toUserId // ignore: cast_nullable_to_non_nullable
                      as String?,
            fromUserId: freezed == fromUserId
                ? _value.fromUserId
                : fromUserId // ignore: cast_nullable_to_non_nullable
                      as String?,
            amountCents: freezed == amountCents
                ? _value.amountCents
                : amountCents // ignore: cast_nullable_to_non_nullable
                      as int?,
            status: freezed == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as PaymentStatus?,
            reason: freezed == reason
                ? _value.reason
                : reason // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PaymentIntentImplCopyWith<$Res>
    implements $PaymentIntentCopyWith<$Res> {
  factory _$$PaymentIntentImplCopyWith(
    _$PaymentIntentImpl value,
    $Res Function(_$PaymentIntentImpl) then,
  ) = __$$PaymentIntentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'intentId') String? intentId,
    @JsonKey(name: 'toUserId') String? toUserId,
    @JsonKey(name: 'fromUserId') String? fromUserId,
    @JsonKey(name: 'amountCents') int? amountCents,
    @JsonKey(name: 'status') PaymentStatus? status,
    @JsonKey(name: 'reason') String? reason,
  });
}

/// @nodoc
class __$$PaymentIntentImplCopyWithImpl<$Res>
    extends _$PaymentIntentCopyWithImpl<$Res, _$PaymentIntentImpl>
    implements _$$PaymentIntentImplCopyWith<$Res> {
  __$$PaymentIntentImplCopyWithImpl(
    _$PaymentIntentImpl _value,
    $Res Function(_$PaymentIntentImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PaymentIntent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? intentId = freezed,
    Object? toUserId = freezed,
    Object? fromUserId = freezed,
    Object? amountCents = freezed,
    Object? status = freezed,
    Object? reason = freezed,
  }) {
    return _then(
      _$PaymentIntentImpl(
        intentId: freezed == intentId
            ? _value.intentId
            : intentId // ignore: cast_nullable_to_non_nullable
                  as String?,
        toUserId: freezed == toUserId
            ? _value.toUserId
            : toUserId // ignore: cast_nullable_to_non_nullable
                  as String?,
        fromUserId: freezed == fromUserId
            ? _value.fromUserId
            : fromUserId // ignore: cast_nullable_to_non_nullable
                  as String?,
        amountCents: freezed == amountCents
            ? _value.amountCents
            : amountCents // ignore: cast_nullable_to_non_nullable
                  as int?,
        status: freezed == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as PaymentStatus?,
        reason: freezed == reason
            ? _value.reason
            : reason // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PaymentIntentImpl implements _PaymentIntent {
  const _$PaymentIntentImpl({
    @JsonKey(name: 'intentId') required this.intentId,
    @JsonKey(name: 'toUserId') required this.toUserId,
    @JsonKey(name: 'fromUserId') required this.fromUserId,
    @JsonKey(name: 'amountCents') required this.amountCents,
    @JsonKey(name: 'status') required this.status,
    @JsonKey(name: 'reason') this.reason,
  });

  factory _$PaymentIntentImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentIntentImplFromJson(json);

  @override
  @JsonKey(name: 'intentId')
  final String? intentId;
  @override
  @JsonKey(name: 'toUserId')
  final String? toUserId;
  @override
  @JsonKey(name: 'fromUserId')
  final String? fromUserId;
  @override
  @JsonKey(name: 'amountCents')
  final int? amountCents;
  @override
  @JsonKey(name: 'status')
  final PaymentStatus? status;
  @override
  @JsonKey(name: 'reason')
  final String? reason;

  @override
  String toString() {
    return 'PaymentIntent(intentId: $intentId, toUserId: $toUserId, fromUserId: $fromUserId, amountCents: $amountCents, status: $status, reason: $reason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentIntentImpl &&
            (identical(other.intentId, intentId) ||
                other.intentId == intentId) &&
            (identical(other.toUserId, toUserId) ||
                other.toUserId == toUserId) &&
            (identical(other.fromUserId, fromUserId) ||
                other.fromUserId == fromUserId) &&
            (identical(other.amountCents, amountCents) ||
                other.amountCents == amountCents) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.reason, reason) || other.reason == reason));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    intentId,
    toUserId,
    fromUserId,
    amountCents,
    status,
    reason,
  );

  /// Create a copy of PaymentIntent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentIntentImplCopyWith<_$PaymentIntentImpl> get copyWith =>
      __$$PaymentIntentImplCopyWithImpl<_$PaymentIntentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentIntentImplToJson(this);
  }
}

abstract class _PaymentIntent implements PaymentIntent {
  const factory _PaymentIntent({
    @JsonKey(name: 'intentId') required final String? intentId,
    @JsonKey(name: 'toUserId') required final String? toUserId,
    @JsonKey(name: 'fromUserId') required final String? fromUserId,
    @JsonKey(name: 'amountCents') required final int? amountCents,
    @JsonKey(name: 'status') required final PaymentStatus? status,
    @JsonKey(name: 'reason') final String? reason,
  }) = _$PaymentIntentImpl;

  factory _PaymentIntent.fromJson(Map<String, dynamic> json) =
      _$PaymentIntentImpl.fromJson;

  @override
  @JsonKey(name: 'intentId')
  String? get intentId;
  @override
  @JsonKey(name: 'toUserId')
  String? get toUserId;
  @override
  @JsonKey(name: 'fromUserId')
  String? get fromUserId;
  @override
  @JsonKey(name: 'amountCents')
  int? get amountCents;
  @override
  @JsonKey(name: 'status')
  PaymentStatus? get status;
  @override
  @JsonKey(name: 'reason')
  String? get reason;

  /// Create a copy of PaymentIntent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentIntentImplCopyWith<_$PaymentIntentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Balance _$BalanceFromJson(Map<String, dynamic> json) {
  return _Balance.fromJson(json);
}

/// @nodoc
mixin _$Balance {
  @JsonKey(name: 'currency')
  String get currency => throw _privateConstructorUsedError;
  @JsonKey(name: 'current')
  num get current => throw _privateConstructorUsedError;
  @JsonKey(name: 'overdrawn')
  bool get overdrawn => throw _privateConstructorUsedError;

  /// Serializes this Balance to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Balance
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BalanceCopyWith<Balance> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BalanceCopyWith<$Res> {
  factory $BalanceCopyWith(Balance value, $Res Function(Balance) then) =
      _$BalanceCopyWithImpl<$Res, Balance>;
  @useResult
  $Res call({
    @JsonKey(name: 'currency') String currency,
    @JsonKey(name: 'current') num current,
    @JsonKey(name: 'overdrawn') bool overdrawn,
  });
}

/// @nodoc
class _$BalanceCopyWithImpl<$Res, $Val extends Balance>
    implements $BalanceCopyWith<$Res> {
  _$BalanceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Balance
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currency = null,
    Object? current = null,
    Object? overdrawn = null,
  }) {
    return _then(
      _value.copyWith(
            currency: null == currency
                ? _value.currency
                : currency // ignore: cast_nullable_to_non_nullable
                      as String,
            current: null == current
                ? _value.current
                : current // ignore: cast_nullable_to_non_nullable
                      as num,
            overdrawn: null == overdrawn
                ? _value.overdrawn
                : overdrawn // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BalanceImplCopyWith<$Res> implements $BalanceCopyWith<$Res> {
  factory _$$BalanceImplCopyWith(
    _$BalanceImpl value,
    $Res Function(_$BalanceImpl) then,
  ) = __$$BalanceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'currency') String currency,
    @JsonKey(name: 'current') num current,
    @JsonKey(name: 'overdrawn') bool overdrawn,
  });
}

/// @nodoc
class __$$BalanceImplCopyWithImpl<$Res>
    extends _$BalanceCopyWithImpl<$Res, _$BalanceImpl>
    implements _$$BalanceImplCopyWith<$Res> {
  __$$BalanceImplCopyWithImpl(
    _$BalanceImpl _value,
    $Res Function(_$BalanceImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Balance
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currency = null,
    Object? current = null,
    Object? overdrawn = null,
  }) {
    return _then(
      _$BalanceImpl(
        currency: null == currency
            ? _value.currency
            : currency // ignore: cast_nullable_to_non_nullable
                  as String,
        current: null == current
            ? _value.current
            : current // ignore: cast_nullable_to_non_nullable
                  as num,
        overdrawn: null == overdrawn
            ? _value.overdrawn
            : overdrawn // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$BalanceImpl implements _Balance {
  const _$BalanceImpl({
    @JsonKey(name: 'currency') required this.currency,
    @JsonKey(name: 'current') required this.current,
    @JsonKey(name: 'overdrawn') required this.overdrawn,
  });

  factory _$BalanceImpl.fromJson(Map<String, dynamic> json) =>
      _$$BalanceImplFromJson(json);

  @override
  @JsonKey(name: 'currency')
  final String currency;
  @override
  @JsonKey(name: 'current')
  final num current;
  @override
  @JsonKey(name: 'overdrawn')
  final bool overdrawn;

  @override
  String toString() {
    return 'Balance(currency: $currency, current: $current, overdrawn: $overdrawn)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BalanceImpl &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.current, current) || other.current == current) &&
            (identical(other.overdrawn, overdrawn) ||
                other.overdrawn == overdrawn));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, currency, current, overdrawn);

  /// Create a copy of Balance
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BalanceImplCopyWith<_$BalanceImpl> get copyWith =>
      __$$BalanceImplCopyWithImpl<_$BalanceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BalanceImplToJson(this);
  }
}

abstract class _Balance implements Balance {
  const factory _Balance({
    @JsonKey(name: 'currency') required final String currency,
    @JsonKey(name: 'current') required final num current,
    @JsonKey(name: 'overdrawn') required final bool overdrawn,
  }) = _$BalanceImpl;

  factory _Balance.fromJson(Map<String, dynamic> json) = _$BalanceImpl.fromJson;

  @override
  @JsonKey(name: 'currency')
  String get currency;
  @override
  @JsonKey(name: 'current')
  num get current;
  @override
  @JsonKey(name: 'overdrawn')
  bool get overdrawn;

  /// Create a copy of Balance
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BalanceImplCopyWith<_$BalanceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Account _$AccountFromJson(Map<String, dynamic> json) {
  return _Account.fromJson(json);
}

/// @nodoc
mixin _$Account {
  @JsonKey(name: '_id')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'number')
  String get number => throw _privateConstructorUsedError;
  @JsonKey(name: 'accountHolderName')
  String get accountHolderName => throw _privateConstructorUsedError;
  @JsonKey(name: 'type')
  String get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'institution')
  String get institution => throw _privateConstructorUsedError;
  @JsonKey(name: 'balance')
  Balance get balance => throw _privateConstructorUsedError;

  /// Serializes this Account to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Account
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AccountCopyWith<Account> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountCopyWith<$Res> {
  factory $AccountCopyWith(Account value, $Res Function(Account) then) =
      _$AccountCopyWithImpl<$Res, Account>;
  @useResult
  $Res call({
    @JsonKey(name: '_id') String id,
    @JsonKey(name: 'name') String name,
    @JsonKey(name: 'number') String number,
    @JsonKey(name: 'accountHolderName') String accountHolderName,
    @JsonKey(name: 'type') String type,
    @JsonKey(name: 'institution') String institution,
    @JsonKey(name: 'balance') Balance balance,
  });

  $BalanceCopyWith<$Res> get balance;
}

/// @nodoc
class _$AccountCopyWithImpl<$Res, $Val extends Account>
    implements $AccountCopyWith<$Res> {
  _$AccountCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Account
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? number = null,
    Object? accountHolderName = null,
    Object? type = null,
    Object? institution = null,
    Object? balance = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            number: null == number
                ? _value.number
                : number // ignore: cast_nullable_to_non_nullable
                      as String,
            accountHolderName: null == accountHolderName
                ? _value.accountHolderName
                : accountHolderName // ignore: cast_nullable_to_non_nullable
                      as String,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String,
            institution: null == institution
                ? _value.institution
                : institution // ignore: cast_nullable_to_non_nullable
                      as String,
            balance: null == balance
                ? _value.balance
                : balance // ignore: cast_nullable_to_non_nullable
                      as Balance,
          )
          as $Val,
    );
  }

  /// Create a copy of Account
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BalanceCopyWith<$Res> get balance {
    return $BalanceCopyWith<$Res>(_value.balance, (value) {
      return _then(_value.copyWith(balance: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AccountImplCopyWith<$Res> implements $AccountCopyWith<$Res> {
  factory _$$AccountImplCopyWith(
    _$AccountImpl value,
    $Res Function(_$AccountImpl) then,
  ) = __$$AccountImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: '_id') String id,
    @JsonKey(name: 'name') String name,
    @JsonKey(name: 'number') String number,
    @JsonKey(name: 'accountHolderName') String accountHolderName,
    @JsonKey(name: 'type') String type,
    @JsonKey(name: 'institution') String institution,
    @JsonKey(name: 'balance') Balance balance,
  });

  @override
  $BalanceCopyWith<$Res> get balance;
}

/// @nodoc
class __$$AccountImplCopyWithImpl<$Res>
    extends _$AccountCopyWithImpl<$Res, _$AccountImpl>
    implements _$$AccountImplCopyWith<$Res> {
  __$$AccountImplCopyWithImpl(
    _$AccountImpl _value,
    $Res Function(_$AccountImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Account
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? number = null,
    Object? accountHolderName = null,
    Object? type = null,
    Object? institution = null,
    Object? balance = null,
  }) {
    return _then(
      _$AccountImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        number: null == number
            ? _value.number
            : number // ignore: cast_nullable_to_non_nullable
                  as String,
        accountHolderName: null == accountHolderName
            ? _value.accountHolderName
            : accountHolderName // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        institution: null == institution
            ? _value.institution
            : institution // ignore: cast_nullable_to_non_nullable
                  as String,
        balance: null == balance
            ? _value.balance
            : balance // ignore: cast_nullable_to_non_nullable
                  as Balance,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AccountImpl implements _Account {
  const _$AccountImpl({
    @JsonKey(name: '_id') required this.id,
    @JsonKey(name: 'name') required this.name,
    @JsonKey(name: 'number') required this.number,
    @JsonKey(name: 'accountHolderName') required this.accountHolderName,
    @JsonKey(name: 'type') required this.type,
    @JsonKey(name: 'institution') required this.institution,
    @JsonKey(name: 'balance') required this.balance,
  });

  factory _$AccountImpl.fromJson(Map<String, dynamic> json) =>
      _$$AccountImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  @JsonKey(name: 'number')
  final String number;
  @override
  @JsonKey(name: 'accountHolderName')
  final String accountHolderName;
  @override
  @JsonKey(name: 'type')
  final String type;
  @override
  @JsonKey(name: 'institution')
  final String institution;
  @override
  @JsonKey(name: 'balance')
  final Balance balance;

  @override
  String toString() {
    return 'Account(id: $id, name: $name, number: $number, accountHolderName: $accountHolderName, type: $type, institution: $institution, balance: $balance)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.accountHolderName, accountHolderName) ||
                other.accountHolderName == accountHolderName) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.institution, institution) ||
                other.institution == institution) &&
            (identical(other.balance, balance) || other.balance == balance));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    number,
    accountHolderName,
    type,
    institution,
    balance,
  );

  /// Create a copy of Account
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountImplCopyWith<_$AccountImpl> get copyWith =>
      __$$AccountImplCopyWithImpl<_$AccountImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AccountImplToJson(this);
  }
}

abstract class _Account implements Account {
  const factory _Account({
    @JsonKey(name: '_id') required final String id,
    @JsonKey(name: 'name') required final String name,
    @JsonKey(name: 'number') required final String number,
    @JsonKey(name: 'accountHolderName') required final String accountHolderName,
    @JsonKey(name: 'type') required final String type,
    @JsonKey(name: 'institution') required final String institution,
    @JsonKey(name: 'balance') required final Balance balance,
  }) = _$AccountImpl;

  factory _Account.fromJson(Map<String, dynamic> json) = _$AccountImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String get id;
  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(name: 'number')
  String get number;
  @override
  @JsonKey(name: 'accountHolderName')
  String get accountHolderName;
  @override
  @JsonKey(name: 'type')
  String get type;
  @override
  @JsonKey(name: 'institution')
  String get institution;
  @override
  @JsonKey(name: 'balance')
  Balance get balance;

  /// Create a copy of Account
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AccountImplCopyWith<_$AccountImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

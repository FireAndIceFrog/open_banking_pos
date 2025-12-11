// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'default_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

DefaultResponse _$DefaultResponseFromJson(Map<String, dynamic> json) {
  return _DefaultResponse.fromJson(json);
}

/// @nodoc
mixin _$DefaultResponse {
  @JsonKey(name: 'success')
  bool get success => throw _privateConstructorUsedError;
  @JsonKey(name: 'data')
  Map<String, dynamic>? get data => throw _privateConstructorUsedError;

  /// Serializes this DefaultResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DefaultResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DefaultResponseCopyWith<DefaultResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DefaultResponseCopyWith<$Res> {
  factory $DefaultResponseCopyWith(
    DefaultResponse value,
    $Res Function(DefaultResponse) then,
  ) = _$DefaultResponseCopyWithImpl<$Res, DefaultResponse>;
  @useResult
  $Res call({
    @JsonKey(name: 'success') bool success,
    @JsonKey(name: 'data') Map<String, dynamic>? data,
  });
}

/// @nodoc
class _$DefaultResponseCopyWithImpl<$Res, $Val extends DefaultResponse>
    implements $DefaultResponseCopyWith<$Res> {
  _$DefaultResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DefaultResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? success = null, Object? data = freezed}) {
    return _then(
      _value.copyWith(
            success: null == success
                ? _value.success
                : success // ignore: cast_nullable_to_non_nullable
                      as bool,
            data: freezed == data
                ? _value.data
                : data // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DefaultResponseImplCopyWith<$Res>
    implements $DefaultResponseCopyWith<$Res> {
  factory _$$DefaultResponseImplCopyWith(
    _$DefaultResponseImpl value,
    $Res Function(_$DefaultResponseImpl) then,
  ) = __$$DefaultResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'success') bool success,
    @JsonKey(name: 'data') Map<String, dynamic>? data,
  });
}

/// @nodoc
class __$$DefaultResponseImplCopyWithImpl<$Res>
    extends _$DefaultResponseCopyWithImpl<$Res, _$DefaultResponseImpl>
    implements _$$DefaultResponseImplCopyWith<$Res> {
  __$$DefaultResponseImplCopyWithImpl(
    _$DefaultResponseImpl _value,
    $Res Function(_$DefaultResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DefaultResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? success = null, Object? data = freezed}) {
    return _then(
      _$DefaultResponseImpl(
        success: null == success
            ? _value.success
            : success // ignore: cast_nullable_to_non_nullable
                  as bool,
        data: freezed == data
            ? _value._data
            : data // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DefaultResponseImpl implements _DefaultResponse {
  const _$DefaultResponseImpl({
    @JsonKey(name: 'success') required this.success,
    @JsonKey(name: 'data') required final Map<String, dynamic>? data,
  }) : _data = data;

  factory _$DefaultResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$DefaultResponseImplFromJson(json);

  @override
  @JsonKey(name: 'success')
  final bool success;
  final Map<String, dynamic>? _data;
  @override
  @JsonKey(name: 'data')
  Map<String, dynamic>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'DefaultResponse(success: $success, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DefaultResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    success,
    const DeepCollectionEquality().hash(_data),
  );

  /// Create a copy of DefaultResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DefaultResponseImplCopyWith<_$DefaultResponseImpl> get copyWith =>
      __$$DefaultResponseImplCopyWithImpl<_$DefaultResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$DefaultResponseImplToJson(this);
  }
}

abstract class _DefaultResponse implements DefaultResponse {
  const factory _DefaultResponse({
    @JsonKey(name: 'success') required final bool success,
    @JsonKey(name: 'data') required final Map<String, dynamic>? data,
  }) = _$DefaultResponseImpl;

  factory _DefaultResponse.fromJson(Map<String, dynamic> json) =
      _$DefaultResponseImpl.fromJson;

  @override
  @JsonKey(name: 'success')
  bool get success;
  @override
  @JsonKey(name: 'data')
  Map<String, dynamic>? get data;

  /// Create a copy of DefaultResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DefaultResponseImplCopyWith<_$DefaultResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

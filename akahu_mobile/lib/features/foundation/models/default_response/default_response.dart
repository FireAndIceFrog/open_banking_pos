import 'package:freezed_annotation/freezed_annotation.dart';

part 'default_response.freezed.dart';
part 'default_response.g.dart';

/// DefaultResponse model aligned with Akahu.
/// Encodes/decodes JSON and provides copyWith via Freezed.
@freezed
class DefaultResponse with _$DefaultResponse {
  const factory DefaultResponse({
    @JsonKey(name: 'success') required bool success,
    @JsonKey(name: 'data') required Map<String, dynamic> data,
  }) = _DefaultResponse;

  factory DefaultResponse.fromJson(Map<String, dynamic> json) => _$DefaultResponseFromJson(json);
}
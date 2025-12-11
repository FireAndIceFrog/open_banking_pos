import 'dart:convert';

import 'package:akahu_mobile/features/foundation/exceptions/http_status_exception.dart';
import 'package:akahu_mobile/features/foundation/models/default_response/default_response.dart';
import 'package:http/http.dart';

extension ResponseExtension on Response {
  T? tryGetData<T>(dynamic fac) {
    if (statusCode < 200 || statusCode >= 300) {
      throw HttpStatusException(statusCode, 'HTTP $statusCode');
    }

    final response = DefaultResponse.fromJson(
      jsonDecode(body) as Map<String, dynamic>,
    );

    if (!response.success) {
      throw Exception(response.data['data']?['reason'] ?? 'Default response has an unsuccessful status');
    }

    if (fac == null) {
      return null;
    }
    
    return response.data != null ? fac(response.data) : null;
  }
}
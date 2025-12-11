import 'dart:convert';

import 'package:akahu_mobile/features/foundation/models/default_response/default_response.dart';
import 'package:akahu_mobile/features/foundation/models/response_extension/response_extension.dart';
import 'package:akahu_mobile/features/payment/constants/api_routes.dart';
import 'package:akahu_mobile/features/payment/models/payment_intent/payment_intent.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import '../models/payment_status/payment_status.dart';

class PaymentApiService {
  final String baseUrl;
  final http.Client client;

  PaymentApiService({http.Client? client})
    : client = client ?? http.Client(),
      baseUrl = dotenv.env['API_BASE_URL'] ?? 'http://localhost:3000';

  Uri _url(String path) => Uri.parse('$baseUrl$path');

  Future<String> createIntent({
    required PaymentIntent payment,
  }) async {
    final res = await client.post(
      _url(PaymentApiRoutes.createPaymentIntent),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(payment.toJson()),
    );
    
    return res.tryGetData<PaymentIntent>(PaymentIntent.fromJson)?.intentId ?? (throw Exception('Failed to create payment intent'));
  }

  Future<(PaymentStatus, String?)> getIntentStatus(String intentId) async {
    final res = await client.get(_url(PaymentApiRoutes.getPaymentIntentStatus(intentId)));
    final getPaymentResult = res.tryGetData<PaymentIntent>(PaymentIntent.fromJson) ?? (throw Exception('Failed to create payment intent'));
    return (getPaymentResult.status ?? PaymentStatus.ERROR, getPaymentResult.reason);
  }

  Future confirmIntent({
    required PaymentIntent payment,
  }) async {
    final res = await client.post(
      _url(PaymentApiRoutes.confirmPaymentIntent(payment.intentId!)),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(payment.toJson()),
    );
    res.tryGetData<DefaultResponse>(DefaultResponse.fromJson);
  }

  void dispose() {
    client.close();
  }
}

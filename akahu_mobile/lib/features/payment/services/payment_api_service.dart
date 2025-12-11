import 'dart:convert';
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
    required String toUserId,
    required double amount,
  }) async {
    final res = await client.post(
      _url('/api/v1/payment'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'toUserId': toUserId, 'amount': double.parse(amount.toStringAsFixed(2))}),
    );
    if (res.statusCode >= 200 && res.statusCode < 300) {
      final data = jsonDecode(res.body) as Map<String, dynamic>;
      final success = data['success'] == true;
      if (!success) {
        throw Exception(data['data']?['reason'] ?? 'Failed to create payment intent');
      }
      return (data['data']?['intentId'] as String?) ?? (throw Exception('intentId missing'));
    }
    throw Exception('HTTP ${res.statusCode}: ${res.body}');
  }

  Future<(PaymentStatus, String?)> getIntentStatus(String intentId) async {
    final res = await client.get(_url('/api/v1/payment/$intentId'));
    if (res.statusCode >= 200 && res.statusCode < 300) {
      final data = jsonDecode(res.body) as Map<String, dynamic>;
      final success = data['success'] == true;
      if (!success) {
        final reason = data['data']?['reason'] as String?;
        return (PaymentStatus.ERROR, reason);
      }
      final statusStr = data['data']?['status'] as String?;
      final status = PaymentStatus.fromJson(statusStr ?? 'ERROR');
      final reason = data['data']?['reason'] as String?;
      return (status, reason);
    }
    throw Exception('HTTP ${res.statusCode}: ${res.body}');
  }

  Future<String?> confirmIntent({
    required String intentId,
    required String fromUserId,
  }) async {
    final res = await client.post(
      _url('/api/v1/payment/confirm/$intentId'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'fromUserId': fromUserId}),
    );
    if (res.statusCode >= 200 && res.statusCode < 300) {
      final data = jsonDecode(res.body) as Map<String, dynamic>;
      final success = data['success'] == true;
      final reason = data['data']?['reason'] as String?;
      if (!success) return reason ?? 'Confirm failed';
      return reason; // may be null on success
    }
    throw Exception('HTTP ${res.statusCode}: ${res.body}');
  }

  void dispose() {
    client.close();
  }
}

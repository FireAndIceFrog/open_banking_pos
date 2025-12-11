class PaymentApiRoutes {
  static const String createPaymentIntent = '/api/v1/payment';
  static String getPaymentIntentStatus(String intentId) => '/api/v1/payment/$intentId';
  static String confirmPaymentIntent(String intentId) => '/api/v1/payment/confirm/$intentId';
}
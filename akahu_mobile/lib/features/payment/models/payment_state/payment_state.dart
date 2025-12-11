
import 'package:akahu_mobile/features/payment/models/payment_intent/payment_intent.dart';

class PaymentState {
  final PaymentIntent? paymentIntent;
  final bool isPolling;

  const PaymentState({
    this.paymentIntent,
    this.isPolling = false,
  });

  PaymentState copyWith({
    PaymentIntent? paymentIntent,
    bool? isPolling,
  }) {
    return PaymentState(
      paymentIntent: paymentIntent ?? this.paymentIntent,
      isPolling: isPolling ?? this.isPolling,
    );
  }
}
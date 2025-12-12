// dart
import 'package:akahu_mobile/features/payment/services/payment_controller.dart';
import 'package:akahu_mobile/features/payment/models/payment_state/payment_state.dart';
import 'package:akahu_mobile/features/payment/models/payment_intent/payment_intent.dart';
import 'package:akahu_mobile/features/payment/models/payment_status/payment_status.dart';

/// Lightweight test double for the PaymentController used in widget tests.
/// Extends the real PaymentController so it matches the provider's expected type.
class TestPaymentController extends PaymentController {
  bool confirmCalled = false;
  int? lastCreateAmountCents;

  @override
  PaymentState build() => const PaymentState();

  @override
  void setScannedIntent(String intentId) {
    state = state.copyWith(
      paymentIntent: PaymentIntent(
        intentId: intentId,
        status: PaymentStatus.PENDING_APPROVAL,
        reason: null,
        toUserId: null,
        fromUserId: null,
        amountCents: null,
      ),
    );
  }

  @override
  Future<void> confirm() async {
    confirmCalled = true;
  }

  @override
  Future<void> create({required int amountCents}) async {
    lastCreateAmountCents = amountCents;
    // emulate behaviour: set an intent id and start pending state
    state = state.copyWith(
      paymentIntent: PaymentIntent(
        intentId: 'generated-intent-${amountCents}',
        status: PaymentStatus.PENDING_APPROVAL,
        reason: null,
        toUserId: null,
        fromUserId: null,
        amountCents: amountCents,
      ),
    );
  }
}

import 'dart:async';
import 'package:akahu_mobile/features/payment/models/payment_intent/payment_intent.dart';
import 'package:akahu_mobile/features/payment/models/payment_status/payment_status.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'payment_api_service.dart';

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

class PaymentController extends Notifier<PaymentState> {
  late final PaymentApiService _api;
  Timer? _poller;

  @override
  PaymentState build() {
    _api = ref.watch(paymentApiServiceProvider);
    return const PaymentState();
  }

  Future<void> create({
    required String toUserId,
    required int amountCents,
  }) async {
    final paymentIntent = PaymentIntent(
      intentId: null,
      toUserId: toUserId,
      amountCents: amountCents,
      fromUserId: null,
      status: null,
    );

    final intentId = await _api.createIntent(
      payment: paymentIntent
    );

    state = state.copyWith(
      paymentIntent: paymentIntent.copyWith(
        intentId: intentId,
        status: PaymentStatus.PENDING_APPROVAL,
      )
    );
  }

  void startPolling({Duration interval = const Duration(seconds: 10)}) {
    if (state.paymentIntent?.intentId == null) return;
    _poller?.cancel();
    state = state.copyWith(isPolling: true);

    _poller = Timer.periodic(interval, (timer) async {
      final id = state.paymentIntent?.intentId;
      if (id == null) {
        stopPolling();
        return;
      }
      try {
        final (status, reason) = await _api.getIntentStatus(id);
        state = state.copyWith(
          paymentIntent: state.paymentIntent?.copyWith(status: status, reason: reason)
        );
        if (status == PaymentStatus.SENT || status == PaymentStatus.DECLINED) {
          stopPolling();
        }
      } catch (e) {
        // On error, keep polling, but surface reason
        state = state.copyWith(
          paymentIntent: state.paymentIntent?.copyWith(reason: e.toString())
        );
      }
    });
  }

  Future<void> confirm({required String fromUserId}) async {
    final id = state.paymentIntent?.intentId;
    if (id == null) return;

    final reason = await _api.confirmIntent(
      payment: PaymentIntent(
        intentId: id,
        fromUserId: fromUserId,
        toUserId: null,
        amountCents: null,
        status: null,
      ),
    );

    if (reason != null) {
      state = state.copyWith(
        paymentIntent: state.paymentIntent?.copyWith(reason: reason)
      );
    }
  }

  void stopPolling() {
    _poller?.cancel();
    _poller = null;
    state = state.copyWith(isPolling: false);
  }

  void setScannedIntent(String intentId) {
    // Used by Make Payment screen after scanning QR
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

  void reset() {
    stopPolling();
    state = const PaymentState();
  }
}

// Providers
final paymentApiServiceProvider = Provider<PaymentApiService>((ref) {
  final service = PaymentApiService();
  ref.onDispose(service.dispose);
  return service;
});

final paymentControllerProvider =
    NotifierProvider<PaymentController, PaymentState>(() {
      return PaymentController();
    });

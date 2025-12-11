import 'dart:async';
import 'package:akahu_mobile/features/payment/models/payment_status/payment_status.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'payment_api_service.dart';

class PaymentState {
  final PaymentStatus? status;
  final String? reason;
  final String? intentId;
  final double? amount;
  final String? toUserId;
  final String? fromUserId;
  final bool isPolling;

  const PaymentState({
    this.status,
    this.reason,
    this.intentId,
    this.amount,
    this.toUserId,
    this.fromUserId,
    this.isPolling = false,
  });

  PaymentState copyWith({
    PaymentStatus? status,
    String? reason,
    String? intentId,
    double? amount,
    String? toUserId,
    String? fromUserId,
    bool? isPolling,
  }) {
    return PaymentState(
      status: status ?? this.status,
      reason: reason ?? this.reason,
      intentId: intentId ?? this.intentId,
      amount: amount ?? this.amount,
      toUserId: toUserId ?? this.toUserId,
      fromUserId: fromUserId ?? this.fromUserId,
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

  Future<void> create({required String toUserId, required double amount}) async {
    final intentId = await _api.createIntent(toUserId: toUserId, amount: double.parse(amount.toStringAsFixed(2)));
    state = state.copyWith(
      intentId: intentId,
      amount: amount,
      toUserId: toUserId,
      status: PaymentStatus.pending,
      reason: null,
    );
  }

  void startPolling({Duration interval = const Duration(seconds: 10)}) {
    if (state.intentId == null) return;
    _poller?.cancel();
    state = state.copyWith(isPolling: true);

    _poller = Timer.periodic(interval, (timer) async {
      final id = state.intentId;
      if (id == null) {
        stopPolling();
        return;
      }
      try {
        final (status, reason) = await _api.getIntentStatus(id);
        state = state.copyWith(status: status, reason: reason);
        if (status == PaymentStatus.complete || status == PaymentStatus.declined) {
          stopPolling();
        }
      } catch (e) {
        // On error, keep polling, but surface reason
        state = state.copyWith(reason: e.toString());
      }
    });
  }

  Future<void> confirm({required String fromUserId}) async {
    final id = state.intentId;
    if (id == null) return;
    state = state.copyWith(fromUserId: fromUserId);
    final reason = await _api.confirmIntent(intentId: id, fromUserId: fromUserId);
    // reason may be null on success; after confirm, status will become complete by poller or server may complete immediately.
    if (reason != null) {
      state = state.copyWith(reason: reason);
    }
  }

  void stopPolling() {
    _poller?.cancel();
    _poller = null;
    state = state.copyWith(isPolling: false);
  }

  void setScannedIntent(String intentId) {
    // Used by Make Payment screen after scanning QR
    state = state.copyWith(intentId: intentId, status: PaymentStatus.pending, reason: null);
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

final paymentControllerProvider = NotifierProvider<PaymentController, PaymentState>(() {
  return PaymentController();
});

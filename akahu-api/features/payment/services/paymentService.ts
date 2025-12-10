// PaymentService orchestrates payment intents using in-memory repo and akahuService

import { AkahuServiceInstance } from '../../foundation/services/akahuService';
import { PaymentRepo } from '../repo/paymentRepo';
import { CreatePaymentRequestInput } from '../types/request/CreatePaymentRequest';
import { ConfirmPaymentRequestInput } from '../types/request/ConfirmPaymentRequest';
import { CreatePaymentResponse } from '../types/response/CreatePaymentResponse';
import { ConfirmPaymentResponse } from '../types/response/ConfirmPaymentResponse';
import { GetPaymentStatusResponse } from '../types/response/GetPaymentStatusResponse';
import { PaymentIntent } from '../types/model/PaymentIntent';
import { uuidv7 } from 'uuidv7';

export class PaymentService {
  async createIntent(payload: CreatePaymentRequestInput): Promise<CreatePaymentResponse> {
    // Payload has been validated via Zod in the route
    const { toUserId, amount } = payload;

    const amountCents = Math.round(amount * 100);
    const intentId = uuidv7();
    const nowIso = new Date().toISOString();

    const intent: PaymentIntent = {
      intentId,
      toUserId,
      amountCents,
      status: 'PENDING_APPROVAL',
      createdAt: nowIso,
      updatedAt: nowIso,
    };

    PaymentRepo.create(intent);

    return {
      success: true,
      data: { intentId },
    };
  }

  async getStatus(intentId: string): Promise<GetPaymentStatusResponse> {
    // intentId validated in the route
    const intent = PaymentRepo.get(intentId);
    if (!intent) {
      return { success: false, data: { status: 'DECLINED', reason: 'Intent not found' } };
    }

    // Optional reconciliation with Akahu when we have a transferId (not implemented in akahuService yet)
    // If future: use AkahuServiceInstance to check transfer status and update.

    return {
      success: true,
      data: {
        status: intent.status,
        reason: intent.reason,
      },
    };
  }

  async confirmIntent(intentId: string, payload: ConfirmPaymentRequestInput): Promise<ConfirmPaymentResponse> {
    // intentId and payload validated in the route
    const { fromUserId } = payload;
    const intent = PaymentRepo.get(intentId);
    if (!intent) {
      return { success: false, data: { reason: 'Intent not found' } };
    }

    // Placeholder: integrate Akahu transfer initiation when available.
    // For now, mark as complete to unblock POS flow.
    // Future:
    // const accounts = await AkahuServiceInstance.getAccounts();
    // Use accounts/fromUserId/toUserId mapping to initiate transfer and set akahuTransferId/status accordingly.

    const updated = PaymentRepo.update(intentId, {
      fromUserId,
      status: 'SENT',
      reason: undefined,
      // akahuTransferId: 'placeholder',
    });

    if (!updated) {
      return { success: false, data: { reason: 'Failed to update intent' } };
    }

    return { success: true, data: {} };
  }
}

export const PaymentServiceInstance = new PaymentService();

import type { IPaymentRepo } from '../repo/IPaymentRepo';
import { inject, injectable } from 'inversify';
import { CreatePaymentRequestInput } from '../types/request/CreatePaymentRequest';
import { CreatePaymentResponse } from '../types/response/CreatePaymentResponse';
import { ConfirmPaymentResponse } from '../types/response/ConfirmPaymentResponse';
import { GetPaymentStatusResponse } from '../types/response/GetPaymentStatusResponse';
import { PaymentIntent } from '../types/model/PaymentIntent';
import { uuidv7 } from 'uuidv7';
import { TYPES } from '@/features/foundation/di/types';

@injectable()
export class PaymentService {
  constructor(
    @inject(TYPES.PaymentRepo) private repo: IPaymentRepo,
  ) {}

  async createIntent(toUserId:string, payload: CreatePaymentRequestInput): Promise<CreatePaymentResponse> {
    const { amountCents } = payload;

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

    this.repo.create(intent);

    return {
      success: true,
      data: { intentId },
    };
  }

  async getStatus(intentId: string): Promise<GetPaymentStatusResponse> {
    const intent = this.repo.get(intentId);
    if (!intent) {
      return { success: false, data: { status: 'DECLINED', reason: 'Intent not found' } };
    }

    return {
      success: true,
      data: {
        status: intent.status,
        reason: intent.reason,
      },
    };
  }

  async confirmIntent(intentId: string, fromUserId: string): Promise<ConfirmPaymentResponse> {
    const intent = this.repo.get(intentId);
    if (!intent) {
      return { success: false, data: { reason: 'Intent not found' } };
    }

    const updated = this.repo.update(intentId, {
      fromUserId,
      status: 'SENT',
      reason: undefined,
    });

    if (!updated) {
      return { success: false, data: { reason: 'Failed to update intent' } };
    }

    return { success: true, data: {} };
  }
}

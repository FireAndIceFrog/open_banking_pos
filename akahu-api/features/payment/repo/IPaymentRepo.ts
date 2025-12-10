// Contract for payment repository

import type { PaymentIntent } from '../types/model/PaymentIntent';

export interface IPaymentRepo {
  create(intent: PaymentIntent): PaymentIntent;
  get(intentId: string): PaymentIntent | null;
  update(intentId: string, patch: Partial<PaymentIntent>): PaymentIntent | null;
}

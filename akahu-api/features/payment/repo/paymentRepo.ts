// In-memory repository for PaymentIntent
import { PaymentIntent } from "../types/model/PaymentIntent";
import { IPaymentRepo } from "./IPaymentRepo";
import { injectable } from "inversify";

@injectable()
export class InMemoryPaymentRepo implements IPaymentRepo {
  private store: Map<string, PaymentIntent> = new Map();

  create(intent: PaymentIntent) {
    this.store.set(intent.intentId, intent);
    return intent;
  }

  get(intentId: string) {
    return this.store.get(intentId) || null;
  }

  update(intentId: string, patch: Partial<PaymentIntent>) {
    const existing = this.store.get(intentId);
    if (!existing) return null;
    const updated: PaymentIntent = {
      ...existing,
      ...patch,
      updatedAt: new Date().toISOString(),
    };
    this.store.set(intentId, updated);
    return updated;
  }
}
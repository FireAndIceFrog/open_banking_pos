import { PaymentStatus } from "akahu";

export interface PaymentIntent {
  intentId: string; // uuidv7
  toUserId: string;
  fromUserId?: string;
  amountCents: number;
  status: PaymentStatus;
  reason?: string;
  akahuTransferId?: string;
  createdAt: string; // ISO
  updatedAt: string; // ISO
}

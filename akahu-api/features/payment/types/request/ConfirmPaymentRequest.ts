import { z } from 'zod';

export const ConfirmPaymentRequest = z.object({
  fromUserId: z.string().min(1, 'fromUserId is required'),
});

export type ConfirmPaymentRequestInput = z.infer<typeof ConfirmPaymentRequest>;

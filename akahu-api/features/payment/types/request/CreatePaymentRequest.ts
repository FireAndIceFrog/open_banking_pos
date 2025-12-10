import { z } from 'zod';

export const CreatePaymentRequest = z.object({
  toUserId: z.string().min(1, 'toUserId is required'),
  amountCents: z.number().int().positive(),
});

export type CreatePaymentRequestInput = z.infer<typeof CreatePaymentRequest>;

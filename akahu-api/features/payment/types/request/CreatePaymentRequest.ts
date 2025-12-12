import { z } from 'zod';

export const CreatePaymentRequest = z.object({
  amountCents: z.number().int().positive(),
});

export type CreatePaymentRequestInput = z.infer<typeof CreatePaymentRequest>;

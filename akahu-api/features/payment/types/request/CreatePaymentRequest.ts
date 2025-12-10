import { z } from 'zod';

// Two-decimal amount validator: amount * 100 must be an integer and > 0
const twoDecimalAmount = z
  .number()
  .finite()
  .refine((a) => {
    const cents = Math.round(a * 100);
    return cents === a * 100 && cents > 0;
  }, { message: 'Amount must be > 0 with two decimals' });

export const CreatePaymentRequest = z.object({
  toUserId: z.string().min(1, 'toUserId is required'),
  amount: twoDecimalAmount,
});

export type CreatePaymentRequestInput = z.infer<typeof CreatePaymentRequest>;

import { z } from 'zod';

export const DefaultAccountRequest = z.object({
  accountNum: z.string().min(1, 'accountNum is required'),
});

export type DefaultAccountRequestInput = z.infer<typeof DefaultAccountRequest>;
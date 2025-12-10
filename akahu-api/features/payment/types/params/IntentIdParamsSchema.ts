import { z } from 'zod';
import { isValidIntentId } from '../../utils/validation';

export const IntentIdSchema = z.string().refine(isValidIntentId, {
  message: 'Invalid intentId',
});
export const IntentIdParamsSchema = z.object({
  intentId: IntentIdSchema,
});

export type IntentIdParams = z.infer<typeof IntentIdParamsSchema>;

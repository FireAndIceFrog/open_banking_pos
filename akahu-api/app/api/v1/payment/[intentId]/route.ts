import { NextRequest, NextResponse } from 'next/server';
import { PaymentService } from '../../../../../features/payment/services/paymentService';
import { GetPaymentStatusResponse } from '@/features/payment/types/response/GetPaymentStatusResponse';
import { IntentIdSchema } from '@/features/payment/types/params/IntentIdParamsSchema';
import { container } from '@/features/foundation/di/container';
import { TYPES } from '@/features/foundation/di/types';

export async function GET(_req: NextRequest, { params }: { params: { intentId: string } }) {
  try {
    const intentId = params.intentId;

    // Zod-validated intentId
    try {
      IntentIdSchema.parse(intentId);
    } catch (err: any) {
      const reason = err?.issues?.[0]?.message ?? 'Invalid intentId';
      return NextResponse.json(
        { success: false, data: { status: 'declined', reason } },
        { status: 400 }
      );
    }

    const paymentService = container.get<PaymentService>(TYPES.PaymentService);
    const result: GetPaymentStatusResponse = await paymentService.getStatus(intentId);
    return NextResponse.json(result, { status: result.success ? 200 : 404 });
  } catch {
    return NextResponse.json({ success: false, data: { status: 'declined', reason: 'Invalid request' } }, { status: 400 });
  }
}

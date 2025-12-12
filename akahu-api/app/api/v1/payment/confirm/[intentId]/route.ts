import { NextRequest, NextResponse } from 'next/server';
import { ConfirmPaymentResponse } from '@/features/payment/types/response/ConfirmPaymentResponse';
import { IntentIdParamsSchema } from '@/features/payment/types/params/IntentIdParamsSchema';
import { container } from '@/features/foundation/di/container';
import { TYPES } from '@/features/foundation/di/types';
import { PaymentService } from '@/features/payment/services/paymentService';

export async function POST(_: NextRequest, { params }: { params: Promise<{ intentId: string }> }) {
  try {
    let intentId: string;

    // Zod-validated intentId
    try {
      intentId = IntentIdParamsSchema.parse(await params).intentId;
    } catch (err: any) {
      const reason = err?.issues?.[0]?.message ?? 'Invalid intentId';
      return NextResponse.json({ success: false, data: { reason } }, { status: 400 });
    }

    const paymentService = container.get<PaymentService>(TYPES.PaymentService);
    const result: ConfirmPaymentResponse = await paymentService.confirmIntent(intentId, process.env.USER_TOKEN || "");
    
    return NextResponse.json(result, { status: result.success ? 200 : 400 });
  } catch {
    return NextResponse.json({ success: false, data: { reason: 'Invalid request' } }, { status: 400 });
  }
}

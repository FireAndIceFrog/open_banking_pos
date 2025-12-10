import { NextRequest, NextResponse } from 'next/server';
import { ConfirmPaymentRequest, ConfirmPaymentRequestInput } from '@/features/payment/types/request/ConfirmPaymentRequest';
import { ConfirmPaymentResponse } from '@/features/payment/types/response/ConfirmPaymentResponse';
import { IntentIdSchema } from '@/features/payment/types/params/IntentIdParamsSchema';
import { container } from '@/features/foundation/di/container';
import { TYPES } from '@/features/foundation/di/types';
import { PaymentService } from '@/features/payment/services/paymentService';

export async function POST(req: NextRequest, { params }: { params: { intentId: string } }) {
  try {
    const intentId = params.intentId;

    // Zod-validated intentId
    try {
      IntentIdSchema.parse(intentId);
    } catch (err: any) {
      const reason = err?.issues?.[0]?.message ?? 'Invalid intentId';
      return NextResponse.json({ success: false, data: { reason } }, { status: 400 });
    }

    const raw = await req.json();
    let body: ConfirmPaymentRequestInput;
    try {
      body = ConfirmPaymentRequest.parse(raw) as ConfirmPaymentRequestInput;
    } catch (err: any) {
      const reason = err?.issues?.[0]?.message ?? 'Invalid payload';
      return NextResponse.json({ success: false, data: { reason } }, { status: 400 });
    }

    const paymentService = container.get<PaymentService>(TYPES.PaymentService);
    const result: ConfirmPaymentResponse = await paymentService.confirmIntent(intentId, body);
    return NextResponse.json(result, { status: result.success ? 200 : 400 });
  } catch {
    return NextResponse.json({ success: false, data: { reason: 'Invalid request' } }, { status: 400 });
  }
}

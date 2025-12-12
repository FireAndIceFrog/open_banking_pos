import { NextRequest, NextResponse } from 'next/server';
import { PaymentService } from '../../../../features/payment/services/paymentService';
import { CreatePaymentResponse } from '@/features/payment/types/response/CreatePaymentResponse';
import { CreatePaymentRequest, CreatePaymentRequestInput } from '@/features/payment/types/request/CreatePaymentRequest';
import { container } from '@/features/foundation/di/container';
import { TYPES } from '@/features/foundation/di/types';

export async function POST(req: NextRequest) {
  try {
    const raw = await req.json();
    const body = CreatePaymentRequest.parse(raw);

    const paymentService = container.get<PaymentService>(TYPES.PaymentService);
    
    const result: CreatePaymentResponse = await paymentService.createIntent(
      process.env.USER_TOKEN || "", 
      body as CreatePaymentRequestInput,
    );

    return NextResponse.json(result, { status: result.success ? 200 : 400 });
  } catch (err: any) {
    const reason = err?.issues?.[0]?.message ?? 'Invalid request';
    return NextResponse.json({ success: false, data: { intentId: '', reason } }, { status: 400 });
  }
}

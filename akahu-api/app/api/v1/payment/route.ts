import { NextRequest, NextResponse } from 'next/server';
import { PaymentServiceInstance } from '../../../../features/payment/services/paymentService';
import { CreatePaymentResponse } from '@/features/payment/types/response/CreatePaymentResponse';
import { CreatePaymentRequest, CreatePaymentRequestInput } from '@/features/payment/types/request/CreatePaymentRequest';

export async function POST(req: NextRequest) {
  try {
    const raw = await req.json();
    const body = CreatePaymentRequest.parse(raw);

    const result: CreatePaymentResponse = await PaymentServiceInstance.createIntent(body as CreatePaymentRequestInput);
    return NextResponse.json(result, { status: result.success ? 200 : 400 });
  } catch (err: any) {
    const reason = err?.issues?.[0]?.message ?? 'Invalid request';
    return NextResponse.json({ success: false, data: { intentId: '', reason } }, { status: 400 });
  }
}

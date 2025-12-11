import { NextRequest, NextResponse } from "next/server";
import { container } from '@/features/foundation/di/container';
import { TYPES } from '@/features/foundation/di/types';
import { AccountService } from "@/features/accounts/service/AccountService";
import { DefaultAccountRequest } from "@/features/accounts/types/request/DefaultAccountRequest";

export async function POST(req: NextRequest) {
  try {
    const json = await req.json();
    const parsedRequest = DefaultAccountRequest.parse(json);

    const accountService = container.get<AccountService>(TYPES.AccountService);
    await accountService.setDefaultPaymentAccount(process.env.USER_TOKEN || '', parsedRequest.accountNum);

    return NextResponse.json({
      success: true,
      data: {}
    });
  } catch (err: any) {
    console.error(err.response?.data || err.message);
    return NextResponse.json({ 
        success: false, 
        data: { reason: 'Failed to set default account' },
    }, { status: 500 });
  }
}

export async function GET() {
    try {
      const accountService = container.get<AccountService>(TYPES.AccountService);
      const defaultAccount = await accountService.getDefaultPaymentAccount(process.env.USER_TOKEN || '');

        if (!defaultAccount) {
            return NextResponse.json({
                success: false, 
                data: { reason: 'No default account set' },
            }, { status: 404 });
        }
        return NextResponse.json({
            success: true,
            data: defaultAccount
        });
    } catch (err: any) {
      console.error(err.response?.data || err.message);
      return NextResponse.json({ 
          success: false, 
          data: { reason: 'Failed to fetch default account' },
      }, { status: 500 });
    } 
}
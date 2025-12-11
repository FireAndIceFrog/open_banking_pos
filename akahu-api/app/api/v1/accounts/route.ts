import { NextResponse } from "next/server";
import { container } from '@/features/foundation/di/container';
import { TYPES } from '@/features/foundation/di/types';
import { AccountService } from "@/features/accounts/service/AccountService";

export async function GET() {
    try {
      const accountService = container.get<AccountService>(TYPES.AccountService);
      const formattedAccounts = await accountService.getAccountsByUserId(process.env.USER_TOKEN || '');
  
      if (formattedAccounts.length === 0) {
        return NextResponse.json({
          success: false, 
          data: { reason: 'No active accounts found' },
        }, { status: 404 });
      }
  
      return NextResponse.json({
        success: true,
        data: {
          accounts: formattedAccounts,
        }
      });
    } catch (err: any) {
      console.error(err.response?.data || err.message);
      return NextResponse.json({ 
          success: false, 
          data: { reason: 'Failed to fetch accounts' },
      }, { status: 500 });
    }
}

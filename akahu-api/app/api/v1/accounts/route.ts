import { NextResponse } from "next/server";
import { Account } from "akahu";
import { AccountType } from "@/features/accounts/types/AccountType";
import { container } from '@/features/foundation/di/container';
import { TYPES } from '@/features/foundation/di/types';
import { AkahuService } from "@/features/foundation/services/akahuService";

export async function GET() {
  try {
    const akahuService = container.get<AkahuService>(TYPES.AkahuService);
    const accounts = await akahuService.getAccounts();
    const formattedAccounts = accounts
    .filter(x => x.status === 'ACTIVE')
    .map((account: Account) => ({
      _id: account._id,
      name: account.name,
      number: account.formatted_account,
      accountHolderName: account.meta?.holder || 'N/A',
      type: account.type,
      institution: account.connection.name,
      balance: {
        currency: "NZD",
        current: 200,
        overdrawn: false
      }
    } as AccountType));

    if (formattedAccounts.length === 0) {
      return NextResponse.json({ message: "No active accounts found" }, { status: 404 });
    }


    return NextResponse.json(formattedAccounts);
  } catch (err: any) {
    console.error(err.response?.data || err.message);
    return NextResponse.json({ error: "Failed to fetch accounts" }, { status: 500 });
  }
}

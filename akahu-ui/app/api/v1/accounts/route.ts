import { NextResponse } from "next/server";
import { AkahuServiceInstance } from "@/app/services/akahuService";
import { Account } from "akahu";

export async function GET() {
  try {
    const accounts = await AkahuServiceInstance.getAccounts();

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
    }));

    if (formattedAccounts.length === 0) {
      return NextResponse.json({ message: "No active accounts found" }, { status: 404 });
    }


    return NextResponse.json(formattedAccounts);
  } catch (err: any) {
    console.error(err.response?.data || err.message);
    return NextResponse.json({ error: "Failed to fetch accounts" }, { status: 500 });
  }
}

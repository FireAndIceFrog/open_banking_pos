import { injectable } from "inversify";
import { IAccountRepo } from "./IAccountRepo";
import { AccountType } from "../types/AccountType";

@injectable()
export class InMemoryAccountRepo implements IAccountRepo {
    private _defaultPaymentAccounts: Record<string, Pick<AccountType, "number" | "accountHolderName"> > = {};

    constructor(
    ) {}

    async setDefaultPaymentAccount(userId: string, account: AccountType): Promise<void> {
        this._defaultPaymentAccounts[userId] = {
            number: account.number,
            accountHolderName: account.accountHolderName,
        };

        return Promise.resolve();
    }

    async getDefaultPaymentAccount(userId: string): Promise<typeof this._defaultPaymentAccounts[string] | null> {
        const account = this._defaultPaymentAccounts[userId] || null;
        return Promise.resolve(account);
    }
}

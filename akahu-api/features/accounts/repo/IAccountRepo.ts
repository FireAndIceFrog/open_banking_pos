import { AccountType } from "../types/AccountType";

export interface IAccountRepo {
    setDefaultPaymentAccount(userId: string, account: AccountType): Promise<void>;
    getDefaultPaymentAccount(userId: string): Promise<Pick<AccountType, "number" | "accountHolderName"> | null>;
}
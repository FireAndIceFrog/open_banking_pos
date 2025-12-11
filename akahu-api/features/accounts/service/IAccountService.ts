import { AccountType } from "../types/AccountType";

export interface IAccountService {
    getAccountsByUserId(userId: string): Promise<AccountType[]>;
    setDefaultPaymentAccount(userId: string, accountNum: string): Promise<void>;
    getDefaultPaymentAccount(userId: string): Promise<Pick<AccountType, "number" | "accountHolderName"> | null>;
}
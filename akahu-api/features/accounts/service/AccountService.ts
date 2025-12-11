import { injectable, inject } from "inversify";
import { IAccountService } from "./IAccountService";
import { Account } from "akahu";
import { TYPES } from "@/features/foundation/di/types";
import { AkahuService } from "@/features/foundation/services/akahuService";
import { AccountType } from "../types/AccountType";
import { InMemoryAccountRepo } from "../repo/AccountRepo";

const accountLists: Record<string, AccountType[]> = {}
const defaultPaymentAccounts: Record<string, Pick<AccountType, "number" | "accountHolderName"> > = {};

@injectable()
export class AccountService implements IAccountService {

    constructor(
        @inject(TYPES.AkahuService)  private _akahuService: AkahuService,
        @inject(TYPES.AccountRepo)  private _accountRepo: InMemoryAccountRepo,
    ) {}

    async getAccountsByUserId(userId: string): Promise<AccountType[]> {
        if (accountLists[userId]) {
            return accountLists[userId] as unknown as AccountType[];
        } 

        const accounts = await this._akahuService.getAccounts(userId);
        const mappedAccounts = accounts
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

        accountLists[userId] = mappedAccounts;
        return mappedAccounts;
    }

    setDefaultPaymentAccount(userId: string, accountNum: string): Promise<void> {
        const accounts = accountLists[userId];
        if(!accounts || accounts.length === 0) {
            throw new Error("No accounts found for user");
        }

        const account = accounts.find(acc => acc.number === accountNum);
        if(!account) {
            throw new Error("Account not found");
        }

        defaultPaymentAccounts[userId] = {
            number: account.number,
            accountHolderName: account.accountHolderName
        };

        return this._accountRepo.setDefaultPaymentAccount(userId, account);
    }

    getDefaultPaymentAccount(userId: string): Promise<Pick<AccountType, "number" | "accountHolderName"> | null> {
        const cachedAccount = defaultPaymentAccounts[userId];
        if(cachedAccount) {
            return Promise.resolve(cachedAccount);
        }
        return this._accountRepo.getDefaultPaymentAccount(userId);
    }
}
    
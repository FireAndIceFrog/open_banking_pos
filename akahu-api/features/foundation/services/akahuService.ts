import { Account, AkahuClient } from 'akahu';
import { inject, injectable } from 'inversify';
import { TYPES } from '../di/types';

export const InMemoryAkahuStore = {
    userToken: process.env.USER_TOKEN || '',
};

export const accountLists: Record<string, Account[]> = {}

@injectable()
export class AkahuService {
    
    constructor(
        @inject(TYPES.AkahuClient) private client: AkahuClient
    ) {}

    async getAccounts() {
        const token = InMemoryAkahuStore.userToken;
        accountLists[token] = await this.client.accounts.list(token);
        return accountLists[token];
    }
}

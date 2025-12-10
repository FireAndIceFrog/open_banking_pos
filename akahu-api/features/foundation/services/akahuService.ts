import { AkahuClient } from 'akahu';

export const InMemoryAkahuStore = {
    userToken: process.env.USER_TOKEN || '',
};

export class AkahuService {
    private client: AkahuClient;
    private appToken: string;
    constructor(appToken: string, userToken?: string) {
        this.appToken = appToken;
        this.client = new AkahuClient({
            appToken,
        });
        if (userToken) {
            InMemoryAkahuStore.userToken = userToken;
        }
    }

    async getAccounts() {
        const token = InMemoryAkahuStore.userToken;
        return this.client.accounts.list(token);
    }
}

export const AkahuServiceInstance = new AkahuService(
    process.env.APP_TOKEN || ''
);

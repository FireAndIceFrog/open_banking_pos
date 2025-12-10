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


    buildAuthorizationUrl(redirectUri: string, scopes: string[] = ['ENDURING_CONSENT'], state?: string) {
        // Try using SDK helper if available
        if (this.client && (this.client as any).auth && typeof (this.client as any).auth.buildAuthorizationUrl === 'function') {
            try {
                return (this.client).auth.buildAuthorizationUrl({
                    redirect_uri: redirectUri,
                    scope: scopes.join(' '), 
                    state,
                });
            } catch (e) {
                // fall through to manual URL construction for POC
                console.log(e)
            }
        }

        const params = new URLSearchParams({
            response_type: 'code',
            client_id: this.appToken,
            redirect_uri: redirectUri,
            scope: scopes.join(' '),
        });
        if (state) params.set('state', state);

        return `https://akahu.com/oauth/authorize?${params.toString()}`;
    }

    async getAccounts() {
        const token = InMemoryAkahuStore.userToken;
        return this.client.accounts.list(token);
    }
}

export const AkahuServiceInstance = new AkahuService(
    process.env.APP_TOKEN || ''
);

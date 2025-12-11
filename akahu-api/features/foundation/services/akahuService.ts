import { AkahuClient } from 'akahu';
import { inject, injectable } from 'inversify';
import { TYPES } from '../di/types';
import { IAkahuService } from './IAkahuService';

@injectable()
export class AkahuService implements IAkahuService{
    constructor(
        @inject(TYPES.AkahuClient) private client: AkahuClient
    ) {}

    async getAccounts(userToken: string) {
        return await this.client.accounts.list(userToken); 
    }
}

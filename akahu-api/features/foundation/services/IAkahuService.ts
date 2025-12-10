// Contract for Akahu service used by PaymentService

import type { Account } from 'akahu';

export interface IAkahuService {
  getAccounts(): Promise<Account[]>;
  // Future: initiateTransfer(...), getTransferStatus(...), etc.
}

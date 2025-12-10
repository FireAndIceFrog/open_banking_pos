export interface AccountType {
    _id: string;
    name: string;
    number: string;
    accountHolderName: string;
    type: string;
    institution: string;
    balance: {
        currency: string;
        current: number;
        overdrawn: boolean;
    };
}
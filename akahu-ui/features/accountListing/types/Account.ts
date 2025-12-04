export interface Account {
    _id: string,
    name: string,
    accountHolderName: string,
    number: string,
    type: string,
    institution: string,
    balance: {
    currency: string,
    current: number,
    overdrawn: boolean
    }
}
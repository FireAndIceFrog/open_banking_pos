"use client";
import { useGetAccountsQuery } from "./state/slice"

export const AccountListingScreen = () => {

    const {isFetching, data: accounts, error} = useGetAccountsQuery()

    if(error) {
        return (
            <div>Error loading accounts</div>
        )
    }

    if(isFetching) {
        return (
            <div>Loading accounts...</div>
        )
    }

    // we want to display a 2 column grid of accounts
    return (
        <div className="grid grid-cols-2 gap-4">
            {accounts?.map((account) => (
                <section key={account._id} className="border p-4 rounded shadow">
                    <h2 className="text-lg font-bold">{account.name}</h2>
                    <p>{account.number}</p>
                    <p>{account.type}</p>

                    <p className="my-2" >{account.balance.currency} {account.balance.current}</p>
                </section>
            ))}
        </div>
    )   
}
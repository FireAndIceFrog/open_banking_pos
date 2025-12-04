"use client";
import { useGetAccountsQuery } from "./state/slice"
import AccountCard from "./components/AccountCard"

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

    // responsive grid: single column on small screens, two columns from sm+
    return (
        <div className="w-full flex flex-wrap gap-4 justify-center ">
            {accounts?.map((account) => (
                <AccountCard key={account._id} account={account} />
            ))}
        </div>
    )   
}

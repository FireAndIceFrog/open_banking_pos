Read your memory bank api.md file and lets get started implementing a new feature.

We need to implement a payment feature - this is quite a large feature and its going to be quite hard 

We need to implement a way for the mobile app to move money between accounts. 

The first step in this process is initiating a payment. Everything goes in the payment feature.

1. Create the following API routes

post api/v1/payment 
{
    toUserId: string
    amount: number (2 decimal places)
}
returns {
    success: boolean
    data: {
        intentId: string
        reason?: string
    }
}

get api/v1/payment/[intentId]
returns
{
    success: boolean
    data: {
        status: complete | pending | declined
        reason?: string
    }
}

post api/v1/payment/confirm/[intentId]
{
    fromUserId: string
}
returns {
    success: boolean
    data: {
        reason?: string
    }
}

Basically what happens is the POS systemn will need to create a payment intent, then poll the endpoint to see if it has completed very 10s or so. 

The flow is 
POS creates -> POS polls -> user confirms -> poll success -> post displays success.
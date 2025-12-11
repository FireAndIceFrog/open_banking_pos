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

2. The next step we are implementing is the actual UI. 

We need 2 screens and a way to navigate between them 
2.1. POS screen. This is a screen with the numbers 0-9 and a "Start" button Each button must be at least 48px x 48px for acccessibility and must use the style guides we have. Once the start button is shown, a QR tag is shown which can be scanned. Once the payment is successful a big green tick appears and shows success.

-> creates the payment 
-> polls the payment till its done

The second screen is the "make payment" screen one of the account in the account listing screen has a circled check at the bottom right of the card. That one is used to make a payment. 

The payment screen is initiated from a popup icon on the bottom right of the account listing screen. It scans a QR code and then updates the payment with the account details for the from account

-> updates the payment with the from account details
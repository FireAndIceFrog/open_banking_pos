"use client";
import { accountListing } from '@/features/accountListing/state/slice';
import { configureStore } from '@reduxjs/toolkit'

export const makeStore = () => {
  return configureStore({
    reducer: {
      [accountListing.reducerPath]: accountListing.reducer,
    },
    middleware: (getDefaultMiddleware) =>
    getDefaultMiddleware().concat(accountListing.middleware)
  })
}

// Infer the type of makeStore
export type AppStore = ReturnType<typeof makeStore>
// Infer the `RootState` and `AppDispatch` types from the store itself
export type RootState = ReturnType<AppStore['getState']>
export type AppDispatch = AppStore['dispatch']
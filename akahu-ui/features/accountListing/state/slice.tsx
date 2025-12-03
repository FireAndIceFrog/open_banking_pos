"use client";
import { createApi, fetchBaseQuery } from '@reduxjs/toolkit/query/react'
import type { Account } from '../types/Account'

// Define a service using a base URL and expected endpoints
export const accountListing = createApi({
  reducerPath: 'accountListing',
  baseQuery: fetchBaseQuery({ baseUrl: '/api/v1/' }),
  endpoints: (build) => ({
    getAccounts: build.query<Account[], void>({
      query: () => `accounts`,
    }),
  }),
})

// Export hooks for usage in functional components, which are
// auto-generated based on the defined endpoints
export const { useGetAccountsQuery } = accountListing
"use client";

import { useState } from "react";
import { Account } from "../features/accountListing/types/Account";
import { AccountListingScreen } from "@/features/accountListing/screen";

export default function HomePage() {
  return (
    <div className="min-h-screen flex flex-col items-center gap-6 p-8 bg-white text-gray-900 dark:bg-gray-900 dark:text-gray-100">
      <h1 className="text-2xl font-bold m-0">Akahu Demo</h1>
      <p className="m-0 text-gray-500 dark:text-gray-400">Next.js + Akahu POC</p>

      <AccountListingScreen />
    </div>
  );
}

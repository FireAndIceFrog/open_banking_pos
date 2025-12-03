"use client";

import { useState } from "react";

export default function HomePage() {
  const [output, setOutput] = useState<any>(null);

  const fetchAccounts = async () => {
    const res = await fetch("/api/v1/accounts");
    const data = await res.json();
    setOutput(data);
  };

  return (
    <div>
      <h1>Akahu Demo (Next.js API)</h1>
      <button onClick={fetchAccounts}>Fetch Accounts</button>
      <pre>{output ? JSON.stringify(output, null, 2) : "Click to load"}</pre>
    </div>
  );
}

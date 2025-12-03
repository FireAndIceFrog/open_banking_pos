import { NextResponse } from "next/server";
import axios from "axios";

const { APP_TOKEN, USER_TOKEN, AKAHU_API_BASE = "https://api.akahu.io/v1" } =
  process.env;

const defaultHeaders = {
  Authorization: `Bearer ${USER_TOKEN}`,
  "X-Akahu-Id": APP_TOKEN!,
};

export async function GET() {
  try {
    const auth = await axios.get(`${AKAHU_API_BASE}/me`, {
      headers: defaultHeaders,
    });

    if (auth.status !== 200) {
      console.error("Failed to authenticate with Akahu API:", auth.statusText);
      return NextResponse.json({ error: "Authentication failed" }, { status: 401 });
    }
    
    const res = await axios.get(`${AKAHU_API_BASE}/accounts`, {
      headers: defaultHeaders,
    });
    return NextResponse.json(res.data);
  } catch (err: any) {
    console.error(err.response?.data || err.message);
    return NextResponse.json({ error: "Failed to fetch accounts" }, { status: 500 });
  }
}

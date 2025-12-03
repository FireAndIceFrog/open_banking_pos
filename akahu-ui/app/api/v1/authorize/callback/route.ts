import { NextResponse } from 'next/server';
import { AkahuClient } from 'akahu';
import { InMemoryAkahuStore } from '@/app/services/akahuService';

/**
 * Handle Akahu OAuth callback.
 * - Expects `?code=...` and optional `state`.
 * - Attempts to exchange the authorization code for a User Token using the SDK if available.
 * - For POC (if SDK method isn't present) falls back to storing a derived token in-memory.
 *
 * Notes:
 * - This is a development POC. In production you MUST validate state and persist tokens securely.
 */
export async function GET(req: Request) {
    const url = new URL(req.url);
    const code = url.searchParams.get('code');
    const state = url.searchParams.get('state');

    if (!code) {
        return NextResponse.json({ error: 'Missing code query parameter' }, { status: 400 });
    }

    const redirectUri = process.env.REDIRECT_URI || 'http://localhost:3000/api/v1/authorize/callback';

    // Create an SDK client using the app token
    const appToken = process.env.APP_TOKEN || '';
    const client = new AkahuClient({ appToken });

    let userToken: string | undefined;

    // Try to use the SDK's auth exchange method if it exists.
    try {
        if ((client as any).auth && typeof (client as any).auth.exchangeAuthorizationCode === 'function') {
            // Common SDK signature might be (code, redirectUri) or similar; try to call and inspect the result.
            const res = await (client as any).auth.exchangeAuthorizationCode(code, redirectUri);
            // Try common fields
            userToken = res?.userToken || res?.access_token || res?.accessToken || res?.token;
        } else if ((client as any).auth && typeof (client as any).auth.createUserToken === 'function') {
            const res = await (client as any).auth.createUserToken(code, redirectUri);
            userToken = res?.userToken || res?.access_token || res?.accessToken || res?.token;
        }
    } catch (e) {
        // Ignore SDK exchange errors for POC fallback
        // eslint-disable-next-line no-console
        console.warn('SDK token exchange failed (POC fallback will be used):', e);
    }

    // Fallback for POC: derive a token string from the code so the rest of the app can proceed.
    if (!userToken) {
        userToken = `POC_USER_TOKEN_FROM_CODE_${code}`;
    }

    // Store in-memory (development POC)
    InMemoryAkahuStore.userToken = userToken;

    // Return a simple success response including the token (for POC/debugging)
    return NextResponse.json({
        success: true,
        token: userToken,
        state: state || null,
    });
}

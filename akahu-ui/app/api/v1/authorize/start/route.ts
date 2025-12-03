import { NextResponse } from 'next/server';
import { AkahuServiceInstance } from '@/app/services/akahuService';

/**
 * Redirects the user to Akahu's consent page.
 * Accepts optional `state` query param which will be forwarded to Akahu unchanged (POC).
 * Example: GET /api/v1/authorize/start?state=123
 */
export async function GET(req: Request) {
    const url = new URL(req.url);
    const state = url.searchParams.get('state') || undefined;

    const redirectUri = process.env.REDIRECT_URI || 'http://localhost:3000/api/v1/authorize/callback';
    const scopes = ['ENDURING_CONSENT'];

    const consentUrl = AkahuServiceInstance.buildAuthorizationUrl(redirectUri, scopes, state);
    return NextResponse.redirect(consentUrl);
}

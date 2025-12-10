// Shared validation utilities for the payment feature

import { UUID } from 'uuidv7';

/**
 * Validate that the provided id is a UUIDv7.
 */
export function isValidIntentId(id: string): boolean {
  if (!id || typeof id !== 'string') return false;
  try {
    const u = UUID.parse(id);
    return u.getVersion() === 7;
  } catch {
    return false;
  }
}

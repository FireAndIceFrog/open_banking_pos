import { InMemoryPaymentRepo } from './paymentRepo';
import type { PaymentIntent } from '../types/model/PaymentIntent';

describe('InMemoryPaymentRepo', () => {
  const now = new Date().toISOString();

  const makeIntent = (overrides: Partial<PaymentIntent> = {}): PaymentIntent => ({
    intentId: 'i-1',
    toUserId: 'user-b',
    amountCents: 100,
    status: 'PENDING_APPROVAL',
    createdAt: now,
    updatedAt: now,
    ...overrides,
  });

  test('create stores by intentId and returns same object', () => {
    const repo = new InMemoryPaymentRepo();
    const input = makeIntent();

    const created = repo.create(input);

    expect(created).toBe(input);
    expect(repo.get('i-1')).toEqual(input);
  });

  test('get returns null when missing and returns stored when present', () => {
    const repo = new InMemoryPaymentRepo();

    expect(repo.get('missing')).toBeNull();

    const intent = makeIntent({ intentId: 'x' });
    repo.create(intent);

    expect(repo.get('x')).toEqual(intent);
  });

  test('update merges patch and refreshes updatedAt', () => {
    const repo = new InMemoryPaymentRepo();
    const base = makeIntent({ intentId: 'z', status: 'PENDING_APPROVAL' });
    repo.create(base);

    const before = repo.get('z')!;
    const updated = repo.update('z', { status: 'SENT', reason: 'ok' })!;

    expect(updated.intentId).toBe('z');
    expect(updated.status).toBe('SENT');
    expect(updated.reason).toBe('ok');
    expect(new Date(updated.updatedAt).getTime()).toBeGreaterThan(new Date(before.updatedAt).getTime());

    expect(repo.get('z')).toEqual(updated);
  });

  test('update returns null when intent missing', () => {
    const repo = new InMemoryPaymentRepo();
    const res = repo.update('missing', { status: 'SENT' });
    expect(res).toBeNull();
  });
});

import { PaymentService } from './paymentService';
import type { IPaymentRepo } from '../repo/IPaymentRepo';
import type { PaymentIntent } from '../types/model/PaymentIntent';

describe('PaymentService', () => {
  const now = new Date().toISOString();

  const makeIntent = (overrides: Partial<PaymentIntent> = {}): PaymentIntent => ({
    intentId: 'intent-1',
    toUserId: 'user-b',
    amountCents: 500,
    status: 'PENDING_APPROVAL',
    createdAt: now,
    updatedAt: now,
    ...overrides,
  });

  const makeMockRepo = () => {
    return {
      create: jest.fn(),
      get: jest.fn(),
      update: jest.fn(),
    } as jest.Mocked<IPaymentRepo>;
  };

  test('createIntent persists and returns success with intentId', async () => {
    const repo = makeMockRepo();
    repo.create.mockImplementation((i) => i);

    const service = new PaymentService(repo);
    const res = await service.createIntent({ toUserId: 'user-b', amountCents: 123 });

    expect(res.success).toBe(true);
    expect(res.data.intentId).toBeDefined();
    expect(typeof res.data.intentId).toBe('string');
    expect(repo.create).toHaveBeenCalledTimes(1);

    const saved = repo.create.mock.calls[0][0];
    expect(saved.toUserId).toBe('user-b');
    expect(saved.amountCents).toBe(123);
    expect(saved.status).toBe('PENDING_APPROVAL');
    expect(saved.createdAt).toBeDefined();
    expect(saved.updatedAt).toBeDefined();
  });

  test('getStatus returns DECLINED when intent not found', async () => {
    const repo = makeMockRepo();
    repo.get.mockReturnValue(null);

    const service = new PaymentService(repo);
    const res = await service.getStatus('missing');

    expect(res.success).toBe(false);
    expect(res.data.status).toBe('DECLINED');
    expect(res.data.reason).toBe('Intent not found');
  });

  test('getStatus returns status and reason from intent', async () => {
    const repo = makeMockRepo();
    repo.get.mockReturnValue(makeIntent({ status: 'SENT', reason: 'ok' }));

    const service = new PaymentService(repo);
    const res = await service.getStatus('intent-1');

    expect(res.success).toBe(true);
    expect(res.data.status).toBe('SENT');
    expect(res.data.reason).toBe('ok');
  });

  test('confirmIntent fails when intent not found', async () => {
    const repo = makeMockRepo();
    repo.get.mockReturnValue(null);

    const service = new PaymentService(repo);
    const res = await service.confirmIntent('missing', { fromUserId: 'user-a' });

    expect(res.success).toBe(false);
    expect(res.data.reason).toBe('Intent not found');
  });

  test('confirmIntent fails when update returns null', async () => {
    const repo = makeMockRepo();
    repo.get.mockReturnValue(makeIntent());
    repo.update.mockReturnValue(null);

    const service = new PaymentService(repo);
    const res = await service.confirmIntent('intent-1', { fromUserId: 'user-a' });

    expect(res.success).toBe(false);
    expect(res.data.reason).toBe('Failed to update intent');
  });

  test('confirmIntent succeeds and updates repo', async () => {
    const repo = makeMockRepo();
    repo.get.mockReturnValue(makeIntent());
    repo.update.mockReturnValue(makeIntent({ fromUserId: 'user-a', status: 'SENT', reason: undefined }));

    const service = new PaymentService(repo);
    const res = await service.confirmIntent('intent-1', { fromUserId: 'user-a' });

    expect(res.success).toBe(true);
    expect(res.data).toEqual({});

    expect(repo.update).toHaveBeenCalledWith('intent-1', {
      fromUserId: 'user-a',
      status: 'SENT',
      reason: undefined,
    });
  });
});

export interface CreatePaymentResponse {
  success: boolean;
  data: {
    intentId: string;
    reason?: string;
  };
}

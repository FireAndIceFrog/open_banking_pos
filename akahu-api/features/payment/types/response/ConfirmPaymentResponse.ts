export interface ConfirmPaymentResponse {
  success: boolean;
  data: {
    reason?: string;
  };
}

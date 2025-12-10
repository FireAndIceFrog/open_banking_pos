import { PaymentStatus } from "akahu";

export interface GetPaymentStatusResponse {
  success: boolean;
  data: {
    status: PaymentStatus;
    reason?: string;
  };
}

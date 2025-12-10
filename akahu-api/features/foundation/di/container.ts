import 'reflect-metadata';
import { AkahuClient } from "akahu";
import { Container } from "inversify";
import { TYPES } from "./types";
import { IAkahuService } from "../services/IAkahuService";
import { IPaymentRepo } from "@/features/payment/repo/IPaymentRepo";
import { PaymentService } from "@/features/payment/services/paymentService";
import { AkahuService } from "../services/akahuService";
import { InMemoryPaymentRepo } from '@/features/payment/repo/paymentRepo';

export const container = new Container({ defaultScope: 'Singleton' });

container.bind<AkahuClient>(TYPES.AkahuClient).toConstantValue(new AkahuClient({
    appToken: process.env.APP_TOKEN || '',
}));

container.bind<IAkahuService>(TYPES.AkahuService).to(AkahuService);

// payments feature
container.bind<PaymentService>(TYPES.PaymentService).to(PaymentService);
container.bind<IPaymentRepo>(TYPES.PaymentRepo).to(InMemoryPaymentRepo).inSingletonScope();


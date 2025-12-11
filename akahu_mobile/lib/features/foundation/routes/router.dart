import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../components/app_scaffold.dart';
import '../app_text.dart';

// Screens (existing or placeholders)
import '../../accounts/screens/accounts_screen.dart';

// Payments screens will be implemented next
import '../../payment/screens/pos_screen.dart';
import '../../payment/screens/make_payment_screen.dart';

class RoutePaths {
  static const String accounts = '/accounts';
  static const String paymentsPos = '/payments/pos';
  static const String paymentsMake = '/payments/make';
}

/// Simple error page using shared typography
class RouteErrorPage extends StatelessWidget {
  final Exception error;
  const RouteErrorPage({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Error',
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Routing error', style: AppText.h2),
          const SizedBox(height: 8),
          Text(error.toString(), style: AppText.bodySecondary),
        ],
      ),
    );
  }
}

final GoRouter appRouter = GoRouter(
  initialLocation: RoutePaths.accounts,
  routes: [
    GoRoute(
      path: RoutePaths.accounts,
      builder: (context, state) => AppScaffold(
        title: 'Accounts',
        body: const AccountsScreen(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Open the Make Payment screen via bottom-right action
            context.push(RoutePaths.paymentsMake);
          },
          backgroundColor: Colors.white,
          foregroundColor: Colors.black87,
          child: const Icon(Icons.qr_code_scanner),
        ),
      ),
    ),
    GoRoute(
      path: RoutePaths.paymentsPos,
      builder: (context, state) => const AppScaffold(
        title: 'POS',
        body: PosScreen(),
      ),
    ),
    GoRoute(
      path: RoutePaths.paymentsMake,
      builder: (context, state) => const AppScaffold(
        title: 'Make Payment',
        body: MakePaymentScreen(),
      ),
    ),
  ],
  errorBuilder: (context, state) => RouteErrorPage(error: state.error ?? Exception('Unknown route error')),
);

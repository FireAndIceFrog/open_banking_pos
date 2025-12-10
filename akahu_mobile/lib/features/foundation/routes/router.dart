import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../app_colors.dart';
import '../app_text.dart';
import '../components/app_scaffold.dart';
import '../../accounts/screens/accounts_screen.dart';

class RoutePaths {
  static const String accounts = '/accounts';
}

final GoRouter appRouter = GoRouter(
  initialLocation: RoutePaths.accounts,
  routes: <RouteBase>[
    GoRoute(
      path: RoutePaths.accounts,
      name: 'accounts',
      builder: (BuildContext context, GoRouterState state) {
        return const AppScaffold(
          title: 'Accounts',
          body: AccountsScreen(),
        );
      },
    ),
  ],
  errorBuilder: (context, state) {
    return Scaffold(
      body: Center(
        child: Text(
          'Route not found',
          style: AppText.subtitle.copyWith(color: AppColors.textSecondary),
          textAlign: TextAlign.center,
        ),
      ),
    );
  },
);

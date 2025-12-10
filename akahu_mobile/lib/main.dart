import 'package:akahu_mobile/features/foundation/components/app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'features/foundation/app_colors.dart';
import 'features/foundation/app_text.dart';
import 'features/accounts/screens/accounts_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Open Banking',
      theme: buildAppTheme(),
      home: const AppScaffold(
        title: 'Accounts',
        body: AccountsScreen(),
      ),
    );
  }
}

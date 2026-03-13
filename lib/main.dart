import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'theme/app_theme.dart';
import 'screens/home_screen.dart';
import 'models/account.dart';
import 'models/budget.dart';
import 'models/goal.dart';
import 'models/transaction.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter(TransactionSourceAdapter());
  Hive.registerAdapter(TransactionAdapter());
  Hive.registerAdapter(AccountTypeAdapter());
  Hive.registerAdapter(AccountAdapter());
  Hive.registerAdapter(GoalAdapter());
  Hive.registerAdapter(BudgetAdapter());

  runApp(const ProviderScope(child: LedgrApp()));
}

class LedgrApp extends StatelessWidget {
  const LedgrApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LEDGR',
      theme: AppTheme.lightTheme(),
      darkTheme: AppTheme.darkTheme(),
      themeMode: ThemeMode.system,
      home: const HomeScreen(),
    );
  }
}

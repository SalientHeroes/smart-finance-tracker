import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../theme/app_theme.dart';
import '../providers/accounts_provider.dart';
import '../providers/transactions_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accounts = ref.watch(accountsProvider);
    final transactions = ref.watch(transactionsProvider);
    final totalBalance = accounts.fold(
      0.0,
      (sum, account) => sum + account.openingBalance,
    );

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'LEDGR',
                    style: TextStyle(
                      fontFamily: AppTheme.fontMono,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.primaryColor,
                    ),
                  ),
                  Icon(
                    Icons.account_circle_outlined,
                    color: AppTheme.subtextColor,
                    size: 28,
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: AppTheme.primaryColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total Balance',
                      style: TextStyle(
                        fontFamily: AppTheme.fontSans,
                        fontSize: 13,
                        color: Colors.white70,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'RM ${totalBalance.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontFamily: AppTheme.fontMono,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            // ── Transaction List ──
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                itemCount: 0,
                itemBuilder: (context, index) => const SizedBox(),
              ),
            ),

            // ── Empty State ──
            if (transactions.isEmpty)
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.receipt_long_outlined,
                        size: 48,
                        color: AppTheme.subtextColor,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'No transactions yet',
                        style: TextStyle(
                          fontFamily: AppTheme.fontSans,
                          fontSize: 15,
                          color: AppTheme.subtextColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
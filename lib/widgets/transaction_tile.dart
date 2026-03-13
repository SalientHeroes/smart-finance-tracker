import 'package:flutter/material.dart';
import '../models/transaction.dart';
import '../theme/app_theme.dart';

class TransactionTile extends StatelessWidget {
  final Transaction transaction;

  const TransactionTile({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppTheme.cardDark,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              transaction.name,
              style: TextStyle(
                fontFamily: AppTheme.fontSans,
                fontSize: 14,
                color: AppTheme.textColor,
              ),
            ),
            Text(
              'RM ${transaction.amount.toStringAsFixed(2)}',
              style: TextStyle(
                fontFamily: AppTheme.fontMono,
                fontSize: 14,
                color: transaction.amount < 0
                    ? AppTheme.dangerColor
                    : AppTheme.primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
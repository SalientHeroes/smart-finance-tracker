import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/transaction.dart';
import '../providers/transactions_provider.dart';
import '../theme/app_theme.dart';

class AddTransactionScreen extends ConsumerStatefulWidget {
	const AddTransactionScreen({super.key});

	@override
	ConsumerState<AddTransactionScreen> createState() =>
		_AddTransactionScreenState();
}

class _AddTransactionScreenState extends ConsumerState<AddTransactionScreen> {
	final _nameController = TextEditingController();
	final _amountController = TextEditingController();
	String _selectedCategory = 'Food';
	bool _isExpense = true;
	String _selectedDate = DateTime.now().toString().split(' ')[0];

  @override
  void dispose() {
    _nameController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.bgDark,
      appBar: AppBar(
        backgroundColor: AppTheme.bgDark,
        elevation: 0,
        title: Text(
          'ADD TRANSACTION',
          style: TextStyle(
            fontFamily: AppTheme.fontMono,
            fontSize: 14,
            color: AppTheme.textColor,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.close, color: AppTheme.subtextColor),
          onPressed: () => Navigator.pop(context),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Name field ──
            Text(
              'TRANSACTION NAME',
              style: TextStyle(
                fontFamily: AppTheme.fontMono,
                fontSize: 11,
                letterSpacing: 1.5,
                color: AppTheme.subtextColor,
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _nameController,
              style: TextStyle(
                fontFamily: AppTheme.fontSans,
                color: AppTheme.textColor,
              ),
              decoration: InputDecoration(
                filled: true,
                fillColor: AppTheme.cardDark,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                hintText: 'e.g. Nasi Lemak',
                hintStyle: TextStyle(color: AppTheme.subtextColor),
              ),
            ),
            const SizedBox(height: 20),
            // ── Amount field ──
            Text(
              'AMOUNT',
              style: TextStyle(
                fontFamily: AppTheme.fontMono,
                fontSize: 11,
                letterSpacing: 1.5,
                color: AppTheme.subtextColor,
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              style: TextStyle(
                fontFamily: AppTheme.fontMono,
                color: AppTheme.textColor,
              ),
              decoration: InputDecoration(
                filled: true,
                fillColor: AppTheme.cardDark,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                hintText: '0.00',
                hintStyle: TextStyle(color: AppTheme.subtextColor),
                prefixText: 'RM',
                prefixStyle: TextStyle(
                  color: AppTheme.subtextColor,
                  fontFamily: AppTheme.fontMono,
                ),
              ),
            ),
            const SizedBox(height: 20),
            // ── Type toggle ──
            Text(
              'TYPE',
              style: TextStyle(
                fontFamily: AppTheme.fontMono,
                fontSize: 11,
                letterSpacing: 1.5,
                color: AppTheme.subtextColor,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child:GestureDetector(
                    onTap: () => setState (() => _isExpense = true),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color: _isExpense
                          ? AppTheme.dangerColor
                          : AppTheme.cardDark,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          'EXPENSE',
                          style: TextStyle(
                            fontFamily: AppTheme.fontMono,
                            fontSize: 12,
                            color: _isExpense
                              ? Colors.white
                              : AppTheme.subtextColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState (() => _isExpense = false),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color: !_isExpense
                          ? AppTheme.primaryColor
                          : AppTheme.cardDark,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          'INCOME',
                          style: TextStyle(
                            fontFamily: AppTheme.fontMono,
                            fontSize: 12,
                            color: !_isExpense
                              ? Colors.white
                              : AppTheme.subtextColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // ── Category ──
            Text(
              'CATEGORY',
              style: TextStyle(
                fontFamily: AppTheme.fontMono,
                fontSize: 11,
                letterSpacing: 1.5,
                color: AppTheme.subtextColor,
              ),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                'Food', 'Transport', 'Shopping',
                'Bills', 'Health', 'Entertainment',
                'Salary', 'Other',
              ].map((cat) => GestureDetector(
                onTap: () => setState(() => _selectedCategory = cat),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16, vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: _selectedCategory == cat
                      ? AppTheme.primaryColor
                      : AppTheme.cardDark,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    cat,
                    style: TextStyle(
                      fontFamily: AppTheme.fontSans,
                      fontSize: 13,
                      color: _selectedCategory == cat
                        ? Colors.white
                        : AppTheme.subtextColor,
                    ),
                  ),
                ),
              )).toList(),
            ),
            const SizedBox(height: 32),
            // ── Save button ──
            SizedBox(
              width: double.infinity,
              child: GestureDetector(
                onTap: _saveTransaction,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    color: AppTheme.primaryColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      'SAVE TRANSACTION',
                      style: TextStyle(
                        fontFamily: AppTheme.fontMono,
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _saveTransaction () {
    final name = _nameController.text.trim();
    final amountText = _amountController.text.trim();
    
    if (name.isEmpty || amountText.isEmpty) return;

    final amount = double.tryParse(amountText) ?? 0.0;
    final finalAmount = _isExpense ? -amount : amount;

    final transactions = ref.read(transactionsProvider);
    final newId = transactions.isEmpty
      ? 1
      : transactions.last.id + 1;

    ref.read(transactionsProvider.notifier).addTransaction(
      Transaction(
        id: newId,
        name: name,
        category: _selectedCategory,
        amount: finalAmount,
        date: _selectedDate,
        source: TransactionSource.manual,
      ),
    );
    
    Navigator.pop(context);
  }
}
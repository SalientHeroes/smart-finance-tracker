import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/transaction.dart';

class TransactionsNotifier extends StateNotifier<List<Transaction>> {
  TransactionsNotifier() : super([]);
  
  void addTransaction(Transaction transaction) {
    state = [...state, transaction];
  }

  void editTransaction(Transaction updated) {
    state = [
      for (final transaction in state)
        if (transaction.id == updated.id) updated else transaction,
    ];
  }

  void deleteTransaction(int id) {
    state = state.where((transaction) => transaction.id != id).toList();
  }
}

final transactionsProvider = StateNotifierProvider<TransactionsNotifier, List<Transaction>>((ref) {
  return TransactionsNotifier();
});
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/transaction.dart';

class TransactionsNotifier extends StateNotifier<List<Transaction>> {
  TransactionsNotifier() : super([]) {
    _loadFromHive();
  }

  static const _boxName = 'transactions';

  Future<void> _loadFromHive() async {
    final box = await Hive.openBox<Transaction>(_boxName);
    state = box.values.toList();
  }

  Future<void> addTransaction(Transaction transaction) async {
    final box = await Hive.openBox<Transaction>(_boxName);
    await box.put(transaction.id, transaction);
    state = box.values.toList();
  }

  Future<void> editTransaction(Transaction updated) async {
    final box = await Hive.openBox<Transaction>(_boxName);
    await box.put(updated.id, updated);
    state = box.values.toList();
  }

  Future<void> deleteTransaction(int id) async {
    final box = await Hive.openBox<Transaction>(_boxName);
    await box.delete(id);
    state = box.values.toList();
  }
}

final transactionsProvider = StateNotifierProvider<TransactionsNotifier, List<Transaction>>((ref) {
  return TransactionsNotifier();
});
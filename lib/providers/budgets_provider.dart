import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/budget.dart';

class BudgetsNotifier extends StateNotifier<List<Budget>> {
  BudgetsNotifier() : super([]) {
    _loadFromHive();
  }

  static const _boxName = 'budgets';

  Future<void> _loadFromHive() async {
    final box = await Hive.openBox<Budget>(_boxName);
    state = box.values.toList();
  }

  Future<void> addBudget(Budget budget) async {
    final box = await Hive.openBox<Budget>(_boxName);
    await box.put(budget.id, budget);
    state = box.values.toList();
  }

  Future<void> editBudget(Budget updated) async {
    final box = await Hive.openBox<Budget>(_boxName);
    await box.put(updated.id, updated);
    state = box.values.toList();
  }

  Future<void> deleteBudget(int id) async {
    final box = await Hive.openBox<Budget>(_boxName);
    await box.delete(id);
    state = box.values.toList();
  }
}

final budgetsProvider = StateNotifierProvider<BudgetsNotifier, List<Budget>>((
  ref,
) {
  return BudgetsNotifier();
});
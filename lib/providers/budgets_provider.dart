import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/budget.dart';

class BudgetsNotifier extends StateNotifier<List<Budget>> {
  BudgetsNotifier() : super([]);

  void addBudget(Budget budget) {
    state = [...state, budget];
  }

  void editBudget(Budget updated) {
    state = [
      for (final budget in state)
        if (budget.id == updated.id) updated else budget,
    ];
  }

  void deleteBudget(int id) {
    state = state.where((budget) => budget.id != id).toList();
  }
}

final budgetsProvider = StateNotifierProvider<BudgetsNotifier, List<Budget>>((
  ref,
) {
  return BudgetsNotifier();
});
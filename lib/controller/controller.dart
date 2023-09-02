import 'package:get/get.dart';
import '../model/model.dart';

class ExpenseController extends GetxController {
  RxList<Expense> expenses = <Expense>[].obs;
  RxList<Expense> incomes = <Expense>[].obs;


  void addExpense(Expense expense) {
    expenses.add(expense);
    update();
  }

  void addIncome(Expense income) {
    incomes.add(income);
    update();
  }

  get getTotalExpense {
    double total = 0.0;
    for (var expense in expenses) {
      total += expense.amount;
    }
    return total;
  }

  get getTotalIncome {
    double total = 0.0;
    for (var income in incomes) {
      total += income.amount;
    }
    return total;
  }

  Map<String, double> categoryExpenses() {
    final Map<String, double> categoryTotal = {};

    for (var expense in expenses) {
      categoryTotal.update(expense.category, (value) => value + expense.amount,
          ifAbsent: () => expense.amount);
    }

    return categoryTotal;
  }

  Map<String, double> categoryIncomes() {
    final Map<String, double> categoryTotal = {};

    for (var income in incomes) {
      categoryTotal.update(income.category, (value) => value + income.amount,
          ifAbsent: () => income.amount);
    }

    return categoryTotal;
  }

  void removeExpense(int index) {
    expenses.removeAt(index);
    update();
  }

  void removeIncome(int inc) {
    incomes.removeAt(inc);
    update();
  }
}

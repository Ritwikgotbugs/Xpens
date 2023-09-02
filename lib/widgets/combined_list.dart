import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/controller.dart';
import '../model/model.dart';
import '../styles/styles.dart';

class CombinedList extends StatefulWidget {
  const CombinedList({super.key});

  @override
  State<CombinedList> createState() => _CombinedListState();
}

class _CombinedListState extends State<CombinedList> {
  final ExpenseController _expenseController = Get.put(ExpenseController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: _expenseController.expenses.length +
            _expenseController.incomes.length,
        itemBuilder: (context, index) {
          Expense item;
          double displayAmount;
          if (index < _expenseController.expenses.length) {
            item = _expenseController.expenses[index];
            displayAmount = -item.amount;
          } else {
            item = _expenseController
                .incomes[index - _expenseController.expenses.length];
            displayAmount = item.amount;
          }

          return Dismissible(
            key: ValueKey(item),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {
              if (index < _expenseController.expenses.length) {
                _expenseController.removeExpense(index);
              } else {
                _expenseController
                    .removeIncome(index - _expenseController.expenses.length);
              }

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: primary,
                  content: Text(
                    '${item.category} deleted',
                    style: const TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  action: SnackBarAction(
                    label: 'Undo',
                    textColor: Colors.white,
                    onPressed: () {
                      if (displayAmount > 0) {
                        _expenseController.addIncome(item);
                      } else {
                        _expenseController.addExpense(item);
                      }
                    },
                  ),
                ),
              );
            },
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Icon(CupertinoIcons.delete, color: Colors.white),
            ),
            child: ListTile(
              leading: SizedBox(
                width: 40,
                height: 40,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(item.iconCategory),
                ),
              ),
              title: Text(item.category,
                  style: TextStyle(
                    fontSize: item.description.isEmpty ? 18 : 16,
                  )),
              subtitle: item.description.isEmpty
                  ? null
                  : Text(
                      item.description,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
              trailing: Text(
                '${displayAmount >= 0 ? '+' : '-'}₹${displayAmount.abs().toStringAsFixed(1)}',
                style: TextStyle(
                  color: displayAmount >= 0
                      ? const Color.fromARGB(255, 54, 244, 86)
                      : Colors.red,
                  fontSize: 18,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

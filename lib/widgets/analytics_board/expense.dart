import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/controller.dart';

class ExpenseBoard extends StatefulWidget {
  const ExpenseBoard({super.key});

  @override
  State<ExpenseBoard> createState() => _ExpenseBoardState();
}

class _ExpenseBoardState extends State<ExpenseBoard> {
  bool isIncomeSelected = true;
  bool isExpenseSelected = false;
    final ExpenseController expenseController = Get.put(ExpenseController());

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            isIncomeSelected = false;
            isExpenseSelected = true;
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Get.isDarkMode ? Colors.grey[800] : Colors.grey.shade100,
              border: Border.all(
                width: 2,
                color: isExpenseSelected ? Colors.grey : Colors.transparent,
              ),
            ),
            child: ListTile(
              leading: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.red.shade100,
                ),
                child: const Padding(
                  padding: EdgeInsets.all(4),
                  child: Icon(
                    CupertinoIcons.arrow_down_right,
                    color: Colors.red,
                  ),
                ),
              ),
              title: const Text(
                "Expense",
                style: TextStyle(fontSize: 14),
              ),
              subtitle: Text(
                "₹ ${expenseController.getTotalExpense}",
                style: const TextStyle(fontSize: 17),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

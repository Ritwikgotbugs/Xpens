import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/controller.dart';
import '../../model/model.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList({super.key});

  @override
  Widget build(BuildContext context) {
    final expenseController = Get.find<ExpenseController>();
    return Visibility(
      visible: expenseController.expenses.isNotEmpty,
      replacement: Text("Add Expense to get a detailed analysis", style: TextStyle(color: Get.isDarkMode? Colors.white: Colors.black),), // Show this when list is empty
      child: Column(
        children: [
          Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Text(
            "All Expenses",
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.grey[500]
                ),
          ),
        ),
      ],
    ),
    const Divider(
      endIndent: 12,
      indent: 12,
    ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: expenseController.expenses.length,
            itemBuilder: (context, index) {
              Expense expense = expenseController.expenses[index];
              return ListTile(
                leading: SizedBox(
                  width: 40,
                  height: 40,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(expense.iconCategory)),
                ),
                title: Text(
                  expense.category,
                  style: const TextStyle(fontSize: 16,),
                ),
                subtitle: expense.description.isEmpty? null : Text(expense.description),
                trailing: Text(
                  '-₹${expense.amount.toStringAsFixed(1)}',
                  style: const TextStyle(color: Colors.red, fontSize: 18),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

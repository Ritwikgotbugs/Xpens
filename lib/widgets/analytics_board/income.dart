import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/controller.dart';

class IncomeBoard extends StatefulWidget {
  const IncomeBoard({super.key});

  @override
  State<IncomeBoard> createState() => _IncomeBoardState();
}

class _IncomeBoardState extends State<IncomeBoard> {
    final ExpenseController expenseController = Get.put(ExpenseController());

  bool isIncomeSelected = true;
  bool isExpenseSelected = false;
  
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: GestureDetector(
          onTap: () {
            setState(() {
              isIncomeSelected = true;
              isExpenseSelected = false;
            });
          },
          child: Container(
            decoration: BoxDecoration(
              color: Get.isDarkMode ? Colors.grey[800] : Colors.grey.shade100,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                width: 2,
                color: isIncomeSelected ? Colors.grey : Colors.transparent,
              ),
            ),
            child: ListTile(
              leading: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.green.shade100,
                ),
                child: const Padding(
                  padding: EdgeInsets.all(3.0),
                  child: Icon(
                    CupertinoIcons.arrow_up_right,
                    color: Colors.green,
                  ),
                ),
              ),
              title: const Text(
                "Income",
                style: TextStyle(fontSize: 14),
              ),
              subtitle: Text(
                "₹ ${expenseController.getTotalIncome}",
                style: const TextStyle(fontSize: 17),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

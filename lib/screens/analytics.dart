import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xpens/widgets/list_views/expense_list.dart';
import 'package:xpens/widgets/list_views/income_list.dart';
import '../widgets/pie_charts/income_pie.dart';
import '../controller/controller.dart';
import '../widgets/pie_charts/expense_pie.dart';

class Analytics extends StatefulWidget {
  const Analytics({super.key});

  @override
  State<Analytics> createState() => _AnalyticsState();
}

class _AnalyticsState extends State<Analytics> {
  bool isIncomeSelected = true;
  bool isExpenseSelected = false;

  @override
  Widget build(BuildContext context) {
    final ExpenseController expenseController = Get.find();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: const Text("Analytics"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
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
                            color: Get.isDarkMode? Colors.grey[800]: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              width: 2,
                              color: isIncomeSelected
                                  ? Colors.grey
                                  : Colors.transparent,
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
                  ),
                  Expanded(
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
                            color: Get.isDarkMode? Colors.grey[800]: Colors.grey.shade100,
                            border: Border.all(
                              width: 2,
                              color: isExpenseSelected
                                  ? Colors.grey
                                  : Colors.transparent,
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
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20,),
            if (isExpenseSelected) ExpensePieChart() else IncomePieChart(),
            const SizedBox(height: 20,),
            if (isExpenseSelected) const ExpenseList() else const IncomeList()
          ],
        ),
      ),
    );
  }
}

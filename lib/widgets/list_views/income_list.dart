import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/controller.dart';
import '../../model/model.dart';

class IncomeList extends StatelessWidget {
  const IncomeList({super.key});

  @override
  Widget build(BuildContext context) {
    final expenseController = Get.find<ExpenseController>();
    return Visibility(
      visible: expenseController.incomes.isNotEmpty,
      replacement: Text("Add Income to get a detailed analysis",style: TextStyle( color: Get.isDarkMode? Colors.white: Colors.black,),),
      child: Column(
        children: [
          Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Text(
            "All Incomes",
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.grey[500]),
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
            itemCount: expenseController.incomes.length,
            itemBuilder: (context, index) {
              Expense income = expenseController.incomes[index];
              return ListTile(
                leading: SizedBox(
                  width: 40,
                  height: 40,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(income.iconCategory)),
                ),
                title: Text(
                  income.category,
                  style: const TextStyle(fontSize: 16,),
                ),
                subtitle: income.description.isEmpty?
                    null
                    : Text(income.description),
                trailing: Text(
                  '+₹${income.amount.toStringAsFixed(1)}',
                  style: const TextStyle(
                      color: Color.fromARGB(255, 54, 244, 86), fontSize: 18),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

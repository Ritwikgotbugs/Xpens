import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/controller.dart';

class ExpensePieChart extends StatelessWidget {
  final ExpenseController _expenseController = Get.find();

  final List<Color> colors = [
    Colors.redAccent,
    Colors.blueAccent,
    Colors.greenAccent,
    Colors.yellowAccent,
    Colors.purpleAccent,
    Colors.grey,
    Colors.amber,
    Colors.cyanAccent,
    Colors.pinkAccent,
  ];

   ExpensePieChart({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, double> categoryExpenses = _expenseController.categoryExpenses();

    final List<PieChartSectionData> pieChartSections = List.generate(
      categoryExpenses.length,
      (index) => PieChartSectionData(
        color: colors[index % colors.length],
        value: categoryExpenses.values.toList()[index],
        title: categoryExpenses.keys.toList()[index],
        radius: (categoryExpenses.values.toList()[index] > 500 )? 60 : 40,
        titleStyle: TextStyle(
          fontSize: 12,
          color: Get.isDarkMode? Colors.white: Colors.black,
        ),
      ),
    );

    return Column(
      children: [
        SizedBox(
          height: 200,
          width: 200,
          child: PieChart(
            PieChartData(
              centerSpaceRadius: 60,
              sections: pieChartSections,
              sectionsSpace: 2,
              startDegreeOffset: -90,
            ),
          ),
        ),
      ],
    );
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xpens/widgets/combined_list.dart';
import 'package:xpens/widgets/date_divider.dart';
import 'package:xpens/widgets/totalcount.dart';
import '../controller/controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime selectedDate = DateTime.now();
  final ExpenseController _expenseController = Get.put(ExpenseController());

   final RxBool isDark = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Dashboard',
            style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
         
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: CupertinoSwitch(
              value: isDark.value,
              onChanged: (bool newValue) {
                setState(() {
                  
                isDark.value = newValue;
                Get.changeThemeMode(
                  Get.isDarkMode ? ThemeMode.light : ThemeMode.dark,
                );
                });
              },
            ),
         ),

        ],
      ),
      body: Obx(
        () => SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TotalCount(),
              const DateDivider(),
              if (_expenseController.expenses.isEmpty &&
                  _expenseController.incomes.isEmpty)
                Center(child: Image.asset('assets/empty.png'))
              else
                const CombinedList(),
            ],
          ),
        ),
      ),
    );
  }
}

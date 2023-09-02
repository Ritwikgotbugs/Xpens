import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:xpens/screens/add_new_budget.dart';
import 'package:xpens/widgets/combined_list.dart';
import 'package:xpens/widgets/date_divider.dart';
import 'package:xpens/widgets/totalcount.dart';
import '../controller/controller.dart';
import 'package:xpens/main.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime selectedDate = DateTime.now();
  final ExpenseController _expenseController = Get.put(ExpenseController());

  bool isDark = false;

  Future<void> _signOut() async {
    try {
      await supabase.auth.signOut();
    } on AuthException catch (error) {
      SnackBar(
        content: Text(error.message),
        backgroundColor: Theme.of(context).colorScheme.error,
      );
    } catch (error) {
      SnackBar(
        content: const Text('Unexpected error occurred'),
        backgroundColor: Theme.of(context).colorScheme.error,
      );
    } finally {
      if (mounted) {
        Navigator.of(context).pushReplacementNamed('/login');
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              Get.to(AddBudget());
            },
            icon: Icon(Icons.grid_view_rounded)),
        title: const Text('Dashboard',
            style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            onPressed: ()async {
              await _signOut();
            },
            icon: Icon(
              Icons.logout,
              color: Get.isDarkMode ? Colors.white : Colors.black,
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
              DateDivider(),
              if (_expenseController.expenses.isEmpty &&
                  _expenseController.incomes.isEmpty)
                Center(child: Image.asset('assets/empty.png'))
              else
                CombinedList(),
            ],
          ),
        ),
      ),
    );
  }
}

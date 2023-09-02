/*
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xpens/widgets/textfield.dart';

import '../controller/controller.dart';
import '../model/budget.dart';
import '../styles/styles.dart';

class AddBudgetPage extends StatefulWidget {
  @override
  _AddBudgetPageState createState() => _AddBudgetPageState();
}

class _AddBudgetPageState extends State<AddBudgetPage> {
  final TextEditingController amountController = TextEditingController();
  final ExpenseController budget = Get.put(ExpenseController());
  String selectedCategory = 'Food';
  var amount = 0.0.obs;
  final List<String> categories = [
    'Food',
    'Transportation',
    'Groceries',
    'Drinks',
    'Entertainment',
    'Clothing',
    'Housing',
    'Electricity',
    'Others',
  ];

  void categorySheetModal() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Text(
                  'Select a Category',
                  style: TextStyle(
                    fontSize: 16,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 16),
              GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 1,
                  crossAxisSpacing: 1,
                ),
                itemCount: categories.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  final category = categories[index];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCategory = category;
                      });
                      Navigator.of(context).pop();
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 60,
                          height: 60,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'assets/${category.toLowerCase()}.png',
                              // Replace with the actual image assets path
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 12),
                          child: Text(
                            category,
                            style: TextStyle(
                              color: Get.isDarkMode
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void addBudget() {
    final double amount = double.tryParse(amountController.text) ?? 0.0;
    if (amount <= 0) {
      // Handle invalid input (e.g., negative or non-numeric amount)
      return;
    }

    final budgetData = BudgetData(
      category: selectedCategory,
      amount: amount,
      // Replace with the actual image assets path
    );

    // Add budgetData to your RxList
    budget.addBudget(budgetData);
    Get.back(); // Close the modal sheet
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Budget'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
           SizedBox(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.currency_rupee_rounded),
              Obx(
                () {
                  var width = MediaQuery.of(context).size.width - 100;
                  var amountLength = amount.value.toString().length;
                  if (amount.value == 0.0) {
                    width = 100;
                  } else if (amountLength * 20 <
                      MediaQuery.of(context).size.width - 100) {
                    width = amountLength * 20;
                  }
                  return SizedBox(
                    width: width,
                    child: TextField(
                      textAlign: TextAlign.center,
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      controller: amountController,
                      onChanged: (text) {
                        amount.value = double.tryParse(text) ?? 0.0;

                        if (amount.value == 0.0) {
                          amountController.clear();
                        }
                      },
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            width: 0,
                            color: Colors.transparent,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            width: 0,
                            color: Colors.transparent,
                          ),
                        ),
                        border: InputBorder.none,
                        fillColor: Colors.transparent,
                        hintText: '0.0',
                        hintStyle: TextStyle(
                          color: Get.isDarkMode ? Colors.white : Colors.grey,
                          height: 1.0,
                        ),
                        filled: true,
                      ),
                      style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontSize: 40.0,
                          color: Get.isDarkMode ? Colors.white : Colors.black),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    ),
            GestureDetector(
              onTap: categorySheetModal,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        selectedCategory,
                        style: TextStyle(fontSize: 18),
                      ),
                      Icon(Icons.arrow_drop_down),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
           Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: SizedBox(
                height: 50,
                width: MediaQuery.sizeOf(context).width,
                child: ElevatedButton(
                  onPressed: addBudget,
                  style: ButtonStyle(
                    elevation: MaterialStatePropertyAll(0),
                    backgroundColor: const MaterialStatePropertyAll(primary),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      "Add Budget",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
*/
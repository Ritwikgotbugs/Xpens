// ignore_for_file: use_key_in_widget_constructors
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:xpens/screens/nav.dart';
import 'package:xpens/widgets/textfield.dart';
import '../controller/controller.dart';
import '../model/model.dart';
import '../styles/styles.dart';

class AddExpensePage extends StatefulWidget {
  @override
  State<AddExpensePage> createState() => _AddExpensePageState();
}

class _AddExpensePageState extends State<AddExpensePage> {
  final ExpenseController _expenseController = Get.find();
  DateTime selectedDate = DateTime.now();
  final categorycontroller = TextEditingController();
  final TextEditingController descriptioncontroller = TextEditingController();
  final TextEditingController moneycontroller = TextEditingController();

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

  final List<String> iconCategory = [
    'assets/food.png',
    'assets/transport.png',
    'assets/groceries.png',
    'assets/drinks.png',
    'assets/streams.png',
    'assets/clothing.png',
    'assets/housing.png',
    'assets/electricity.png',
    'assets/others.png',
  ];

  String selectedCategory = 'Others';

  bool isPopupVisible = false;

  bool isIncomeSelected = false;
  bool isExpenseSelected = true;

  bool isSwitched = false;
  var amount = 0.0.obs;

  void categotySheetModal() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Container(
            color: Get.isDarkMode ? Colors.grey[900] : Colors.grey[300],
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: Text(
                    'Select a Category',
                    style: TextStyle(
                        fontSize: 16,
                        color: Get.isDarkMode ? Colors.white : Colors.black),
                  ),
                ),
                const SizedBox(height: 16),
                GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 1,
                    crossAxisSpacing: 1,
                  ),
                  itemCount: categories.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
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
                                iconCategory[categories.indexOf(category)],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 12),
                            child: Text(category,
                                style: TextStyle(
                                    color: Get.isDarkMode
                                        ? Colors.white
                                        : Colors.black)),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _selectDate(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          color: Get.isDarkMode ? Colors.grey[900] : Colors.grey[300],
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 200,
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.date,
                  initialDateTime: selectedDate,
                  minimumDate:
                      DateTime.now().subtract(const Duration(days: 90)),
                  maximumDate: DateTime.now().add(const Duration(days: 90)),
                  onDateTimeChanged: (DateTime newDate) {
                    setState(() {
                      selectedDate = newDate;
                    });
                  },
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                    elevation: const MaterialStatePropertyAll(2),
                    backgroundColor: MaterialStatePropertyAll(
                        Get.isDarkMode ? Colors.grey : primary),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Done',
                    style: TextStyle(
                        color: Get.isDarkMode ? Colors.black : Colors.white),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: const Text('Add Expense'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width / 2,
                  decoration: BoxDecoration(
                    color: Get.isDarkMode ? Colors.grey[800] : Colors.grey[200],
                    borderRadius: BorderRadius.circular(50),
                    //border: Border.all(color: Colors.grey),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                isIncomeSelected
                                    ? Colors.greenAccent
                                    : Colors.transparent),
                          ),
                          onPressed: () {
                            setState(() {
                              isIncomeSelected = true;
                              isExpenseSelected = false;
                            });
                          },
                          child: Text(
                            "Income",
                            style: TextStyle(
                                color: isIncomeSelected
                                    ? Colors.black
                                    : Colors.grey),
                          ),
                        ),
                        TextButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                isExpenseSelected
                                    ? const Color.fromARGB(255, 255, 123, 123)
                                    : Colors.transparent),
                          ),
                          onPressed: () {
                            setState(() {
                              isIncomeSelected = false;
                              isExpenseSelected = true;
                            });
                          },
                          child: Text(
                            "Expense",
                            style: TextStyle(
                                color: isExpenseSelected
                                    ? Colors.black
                                    : Colors.grey),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.currency_rupee_rounded),
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
                      controller: moneycontroller,
                      onChanged: (text) {
                        amount.value = double.tryParse(text) ?? 0.0;

                        if (amount.value == 0.0) {
                          moneycontroller.clear();
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
                CustomField(text: "Description", controller: descriptioncontroller),
                GestureDetector(
                  onTap: categotySheetModal,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Get.isDarkMode? Colors.grey[800] : Colors.grey[200],
                        border: Border.all(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 40,
                                height: 40,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(iconCategory[
                                        categories.indexOf(selectedCategory)],),),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(selectedCategory,
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Get.isDarkMode
                                            ? Colors.white
                                            : Colors.black),),
                              ),
                            ],
                          ),
                          const Icon(Icons.arrow_right),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: GestureDetector(
                    onTap: () =>
                        _selectDate(context), // Open bottom sheet modal
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.calendar_today),
                        const SizedBox(width: 10),
                        Text(
                          DateFormat.yMMMMd()
                              .format(selectedDate), // Display selected date
                          style: TextStyle(
                              fontSize: 16,
                              color:
                                  Get.isDarkMode ? Colors.white : Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: SizedBox(
                height: 50,
                width: MediaQuery.sizeOf(context).width,
                child: ElevatedButton(
                  onPressed: () {
                    double amount =
                        double.tryParse(moneycontroller.text) ?? 0.0;
                    if (amount > 0) {
                      Expense newExpense = Expense(
                        date: selectedDate,
                        category: selectedCategory,
                        amount: amount,
                        description: descriptioncontroller.text,
                        iconCategory:
                            iconCategory[categories.indexOf(selectedCategory)],
                      );
                      if (isIncomeSelected) {
                        _expenseController.addIncome(newExpense);
                      } else {
                        _expenseController.addExpense(newExpense);
                      }

                      Get.offAll(() => const NavBar());
                    }
                  },
                  style: ButtonStyle(
                    elevation: const MaterialStatePropertyAll(0),
                    backgroundColor: const MaterialStatePropertyAll(primary),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  child:  Center(
                    child: Text(
                      isExpenseSelected? "Add Expense" : "Add Income",
                      style: const TextStyle(
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

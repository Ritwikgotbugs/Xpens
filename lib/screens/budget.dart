import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xpens/screens/add_new_budget.dart';

class Budget extends StatelessWidget {
  const Budget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: const Text("Budget"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    Get.isDarkMode ? Colors.grey[800] : Colors.grey.shade300),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              onPressed: () {
                Get.to(() => AddBudget());
              },
              child: Row(
                children: [
                  Text(
                    "Add Budget",
                    style: TextStyle(
                        color: Get.isDarkMode ? Colors.white : Colors.black),
                  ),
                  Icon(Icons.add,color: Get.isDarkMode? Colors.white : Colors.black,),
                ],
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Text(
          "Budget",
          style: TextStyle(color: Get.isDarkMode ? Colors.white : Colors.black),
        ),
      ),
    );
  }
}

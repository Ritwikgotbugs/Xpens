import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BudgetPage extends StatelessWidget {
  const BudgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title:  Text("Budget", style: TextStyle(fontWeight: FontWeight.bold, color: Get.isDarkMode ? Colors.white : Colors.black)),
      ),
      body: Center(
        child: Text("Budget", style: TextStyle(fontSize: 12, color: Get.isDarkMode ? Colors.white : Colors.black)),
      )
    );
  }
}
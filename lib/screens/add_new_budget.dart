import 'package:flutter/material.dart';

class AddBudget extends StatelessWidget {
  const AddBudget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        //automaticallyImplyLeading: false, 
        title: const Text("Add Budget"),
      ),
    );
  }
}
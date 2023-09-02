import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomField extends StatefulWidget {
  final TextEditingController controller;
  final String text;
  final bool obscure;
  final TextInputType keyboardType;

  const CustomField({super.key, 
    required this.text, required this.controller,
    this.obscure = false,
    this.keyboardType = TextInputType.text,
    });

  @override
  State<CustomField> createState() => _CustomFieldState();
}

class _CustomFieldState extends State<CustomField> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = widget.controller;
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextField(
        keyboardType: widget.keyboardType,
        obscureText: widget.obscure,
        controller: controller,
        onChanged: (text) {
          setState(() {});
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
          fillColor: Get.isDarkMode ? Colors.grey[800] : Colors.grey[200],
          hintText: widget.text,
          hintStyle: const TextStyle(color: Colors.grey),
          filled: true,
        ),
        style: TextStyle(
            fontSize: 15.0,
            color: Get.isDarkMode ? Colors.white : Colors.black),
      ),
    );
  }
}

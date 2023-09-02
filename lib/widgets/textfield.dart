import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomField extends StatefulWidget {
  final TextEditingController controller;
  final String text;
  final bool obscure;

  CustomField({
    required this.text, required this.controller,
    this.obscure = false,
    });

  @override
  State<CustomField> createState() => _CustomFieldState();
}

class _CustomFieldState extends State<CustomField> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller = widget.controller;
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextField(
        obscureText: widget.obscure,
        controller: _controller,
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

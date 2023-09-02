import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateDivider extends StatelessWidget {
  const DateDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text(
                "Today",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[500]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Text(
                DateFormat('d MMMM').format(DateTime.now()),
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[500]),
              ),
            ),
          ],
        ),
        const Divider(endIndent: 12, indent: 12),
      ],
    );
  }
}

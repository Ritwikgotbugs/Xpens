import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AmountField extends StatelessWidget {
  const AmountField({super.key});

  @override
  Widget build(BuildContext context) {
    var amount = 0.0.obs;
    final moneycontroller = TextEditingController();
    return SizedBox(
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
    );
  }
}

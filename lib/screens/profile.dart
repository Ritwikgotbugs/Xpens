import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var isDark = Get.isDarkMode.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: const Text("Profile"),
      ),
      body: Obx(
        () => Container(
          child: CupertinoSwitch(
            value: isDark
                .value, // Assuming Get.isDarkMode returns a boolean indicating the current theme mode.
            onChanged: (bool newValue) {
              isDark.value = newValue;
              Get.changeThemeMode(
                Get.isDarkMode ? ThemeMode.light : ThemeMode.dark,
              );
            },
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:xpens/screens/nav.dart';
import 'controller/controller.dart';
import 'supabase/login.dart';
import 'supabase/signin.dart';
import 'supabase/auth_screen.dart';

Future<void> main() async {
  await dotenv.load(fileName: "lib/.env");
  await Supabase.initialize(
    url: dotenv.get('SUPABASE_URL'),
    anonKey: dotenv.get('SUPABASE_API'),
  );
  runApp(const MyApp());
}

final supabase = Supabase.instance.client;


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ExpenseController expenseController = ExpenseController();

    return GetMaterialApp(
      theme: ThemeData(
          useMaterial3: true,
          textTheme: GoogleFonts.outfitTextTheme(),
          hoverColor: Colors.transparent),
      darkTheme: ThemeData.dark().copyWith(
          useMaterial3: true,
          textTheme: GoogleFonts.outfitTextTheme(),
          hoverColor: Colors.transparent),
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (_) => const AuthScreen(),
        '/login': (_) =>  LoginPage(),
        '/home': (_) => const NavBar(),
      },
      initialBinding: BindingsBuilder(() {
        Get.put(expenseController);
      }),
    );
  }
}

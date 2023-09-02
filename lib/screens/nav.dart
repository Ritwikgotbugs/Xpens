import '../screens/add_expense.dart';
import 'analytics.dart';
import 'budget.dart';
import '../screens/profile.dart';
import '../styles/styles.dart';
import 'homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const BudgetPage(),
    AddExpensePage(),
     const Analytics(),
    const Profile()
  ];

  void _onItemTapped(index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent, 
        elevation: 0, 
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              tooltip: "Home",
              icon: Icon(
                _selectedIndex==0? CupertinoIcons.house_fill : CupertinoIcons.house,
                size: 20,
              ),
              onPressed: () => _onItemTapped(0),
            ),
            
             IconButton(
              tooltip: "Budget",
              icon: Icon(
                _selectedIndex==1? Icons.wallet : Icons.wallet,
                size: 20,
              ),
              onPressed: () => _onItemTapped(1),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: primary,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
                child: Center(
                  child: IconButton(
                    tooltip: "Add Expense",
                    icon:  const Icon(
                      CupertinoIcons.add,
                      size: 25,
                      color: Colors.white
                    ),
                    onPressed: () => _onItemTapped(2),
                  ),
                ),
              ),
            ),
            IconButton(
              tooltip: "Analytics",
              icon: const Icon(
                Icons.bar_chart,
                size: 20,
              ),
              onPressed: () => _onItemTapped(3),
            ),
             IconButton(
              tooltip: "Profile",
              icon: Icon(
                _selectedIndex==4? CupertinoIcons.person_fill : CupertinoIcons.person,
                size: 20,
              ),
              onPressed: () => _onItemTapped(4),
            ),
          ],
        ),
      ),
    );
  }
}

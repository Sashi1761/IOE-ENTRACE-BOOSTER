import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../screens/home_screen.dart';
import '../screens/quizcategoryscreen.dart';

class BottomNvBar extends StatefulWidget {
  const BottomNvBar({super.key});

  @override
  State<BottomNvBar> createState() => _BottomNvBarState();
}

class _BottomNvBarState extends State<BottomNvBar> {
   List Screens = [
  HomePage(),
  QuizCategoryScreen(),
 ];
  
  int _selectedindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: const Color.fromARGB(255, 74, 16, 11),
        animationDuration: const Duration(milliseconds: 500),
        items: const [
      Icon(Icons.home, size: 30),
          Icon(Icons.list, size: 30),
          Icon(Icons.man, size: 30),
  ],
        index :  _selectedindex,
        onTap: (index) {
          setState(() {
            _selectedindex = index;
          });
        },
      ),
    );
  }
}
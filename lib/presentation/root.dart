// ignore_for_file: library_private_types_in_public_api

import 'package:bdcalling/presentation/assignment2.dart';
import 'package:bdcalling/presentation/assignment3.dart';
import 'package:bdcalling/presentation/home_page.dart';
import 'package:bdcalling/res/commnText.dart';
import 'package:flutter/material.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    Assignment2(),
    Assignment3(),
    Container(
      padding: const EdgeInsets.all(24),
      height: double.infinity,
      child: Center(
        child: commonText(
            "Thank you for reviewing my task, I appreciate your time and feedback!",
            textAlign: TextAlign.center,
            fontSize: 16),
      ),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: _pages[_selectedIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: BottomAppBar(
          color: const Color(0xFF1C212A),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(Icons.home,
                    color: _selectedIndex == 0 ? Colors.red : Colors.grey),
                onPressed: () => _onItemTapped(0),
              ),
              IconButton(
                icon: Icon(Icons.tv_sharp,
                    color: _selectedIndex == 1 ? Colors.red : Colors.grey),
                onPressed: () => _onItemTapped(1),
              ),
              IconButton(
                icon: Icon(Icons.download,
                    color: _selectedIndex == 2 ? Colors.red : Colors.grey),
                onPressed: () => _onItemTapped(2),
              ),
              IconButton(
                icon: Icon(Icons.person,
                    color: _selectedIndex == 3 ? Colors.red : Colors.grey),
                onPressed: () => _onItemTapped(3),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:projectapp/navigations/profile_login.dart';
import 'package:projectapp/views/homePage.dart';
import 'package:projectapp/views/library.dart';
import 'package:projectapp/views/search.dart';

class Tabbar extends StatefulWidget {
  const Tabbar({super.key});

  @override
  State<Tabbar> createState() => _TabbarState();
}

class _TabbarState extends State<Tabbar> {
  int _selectedTab = 0;
  final List<Widget> _pages = [
    Homepage(),
    SearchView(),
    LibraryView(),
    Profile_login(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        onTap: (index) {
          setState(() {
            _selectedTab = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "HOME",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_outlined),
            label: "SEARCH",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_outlined),
            label: "LIST",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outlined),
            label: "PROFILE",
          ),
        ],
      ),
      body: _pages[_selectedTab],
    );
  }
}
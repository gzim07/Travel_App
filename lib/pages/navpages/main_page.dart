// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'bar_item_page.dart';
import 'home_page.dart';
import 'my_page.dart';
import 'search_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages = [HomePage(), BarItemPage(), SearchPage(), MyPage()];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        unselectedFontSize: 0,
        selectedFontSize: 0,
        currentIndex: currentIndex,
        selectedItemColor: Colors.black54,
        unselectedItemColor: Colors.grey.withOpacity(.5),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        items: const [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(
              Icons.apps,
            ),
          ),
          BottomNavigationBarItem(
            label: "Bar",
            icon: Icon(
              Icons.bar_chart,
            ),
          ),
          BottomNavigationBarItem(
            label: "Search",
            icon: Icon(Icons.search),
          ),
          BottomNavigationBarItem(
            label: "My",
            icon: Icon(
              Icons.person,
            ),
          )
        ],
      ),
    );
  }
}

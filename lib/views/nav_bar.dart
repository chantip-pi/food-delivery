import 'package:flutter/material.dart';
import 'package:food_delivery/views/home_page.dart';
import 'package:food_delivery/views/restaurant_page.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int indexBottomNav = 0;
  List widgetOptions = const [HomePage(), Restaurant(), Text('More')];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      floatingActionButton: buildFloatingActionButton(),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.orange,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.more), label: 'More'),
        ],
        currentIndex: indexBottomNav,
        onTap: (value) => setState(() => indexBottomNav = value),
      ),
      body: Center(child: widgetOptions[indexBottomNav]),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[
                Colors.orange,
                Color.fromARGB(
                  255,
                  243,
                  243,
                  243,
                )
              ]),
        ),
      ),
    );
  }

  FloatingActionButton buildFloatingActionButton() {
    return FloatingActionButton(
      onPressed: () {},
      backgroundColor: Colors.orange,
      child: const Icon(Icons.shopping_cart_outlined, color: Colors.white),
    );
  }
}


import 'package:e_commerce/screens/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  String username = "";
  int _page = 0;
  late PageController pageController;

  List<Widget> pageList = [
    const HomeScreen(),
    const Text('home'),
    const Text('home'),
  ];

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  void navigationTapped(int page) {
    pageController.jumpToPage(page);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: onPageChanged,
        children: pageList,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          color: Colors.white,
          elevation: 20,
          child: Container(
            height: 70,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(),
                color: Colors.black),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CupertinoTabBar(
                border: Border.all(color: Colors.black),
                iconSize: 30,
                activeColor: Colors.white,
                backgroundColor: Colors.black,
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: ImageIcon(
                      const AssetImage('assets/icons/ic_home.png'),
                      size: 40,
                      color: (_page == 0) ? Colors.white : Colors.grey,
                    ),
                    label: 'Home',
                    backgroundColor: Colors.white,
                  ),
                  BottomNavigationBarItem(
                      icon: ImageIcon(
                        const AssetImage('assets/icons/ic_cart.png'),
                        size: 40,
                        color: (_page == 1) ? Colors.white : Colors.grey,
                      ),
                      label: 'Cart',
                      backgroundColor: Colors.white),
                  BottomNavigationBarItem(
                    icon: ImageIcon(
                      const AssetImage('assets/icons/ic_profile.png'),
                      size: 20,
                      color: (_page == 2) ? Colors.white : Colors.grey,
                    ),
                    label: 'Profile',
                    backgroundColor: Colors.white,
                  ),
                ],
                onTap: navigationTapped,
                currentIndex: _page,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

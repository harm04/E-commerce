import 'package:e_commerce/admin/screens/adminHome.dart';
import 'package:e_commerce/admin/screens/analytics.dart';
import 'package:e_commerce/admin/screens/inbox.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdminBottomBAr extends StatefulWidget {
  const AdminBottomBAr({super.key});

  @override
  State<AdminBottomBAr> createState() => _AdminBottomBArState();
}

class _AdminBottomBArState extends State<AdminBottomBAr> {
  int _page = 0;
  late PageController pageController;

  List<Widget> pageList = [const AdminHome(), const Analytics(), const Inbox()];

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
        physics: const NeverScrollableScrollPhysics(),
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
                      size: 25,
                      color: (_page == 0) ? Colors.white : Colors.grey,
                    ),
                    label: 'Home',
                    backgroundColor: Colors.white,
                  ),
                  BottomNavigationBarItem(
                      icon: ImageIcon(
                        const AssetImage('assets/icons/ic_analytics.png'),
                        size: 25,
                        color: (_page == 1) ? Colors.white : Colors.grey,
                      ),
                      label: 'Analytics',
                      backgroundColor: Colors.white),
                  BottomNavigationBarItem(
                    icon: ImageIcon(
                      const AssetImage('assets/icons/ic_inbox.png'),
                      size: 25,
                      color: (_page == 2) ? Colors.white : Colors.grey,
                    ),
                    label: 'Inbox',
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

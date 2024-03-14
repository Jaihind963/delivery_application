import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:delivery_app/pages/orderpage.dart';
import 'package:delivery_app/pages/profilepage.dart';
import 'package:delivery_app/pages/walletpage.dart';
import 'package:flutter/material.dart';

import 'myhomepage.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentTab = 0;
  late List<Widget> pages;
  late Widget currentPage;
  late MyHomePage homePage;
  late ProfilePage profilePage;
  late OrderPage orderPage;
  late WalletPage walletPage;

  @override
  void initState() {
    homePage = const MyHomePage();
    profilePage = const ProfilePage();
    orderPage = const OrderPage();
    walletPage = const WalletPage();
    pages = [homePage, orderPage, walletPage, profilePage];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.black,
        backgroundColor: Colors.white,
        animationDuration: const Duration(milliseconds: 500),
        onTap: (int index) {
          setState(() {
            currentTab = index;
          });
        },
        items: const [
          Icon(
            Icons.home_outlined,
            color: Colors.white,
          ),
          Icon(
            Icons.shopping_bag_outlined,
            color: Colors.white,
          ),
          Icon(
            Icons.wallet_outlined,
            color: Colors.white,
          ),
          Icon(
            Icons.person_2_outlined,
            color: Colors.white,
          ),
        ],
      ),
      body: pages[currentTab],
    );
  }
}

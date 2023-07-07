import 'package:flutter/material.dart';
import 'package:food_delivery_flutter_app/models/NavigationNotifier.dart';
import 'package:food_delivery_flutter_app/pages/cart_page.dart';
import 'package:food_delivery_flutter_app/pages/favorite_page.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';
import 'search_page.dart';

// ignore: must_be_immutable
class NestedPage extends StatelessWidget {
  NestedPage(
      {super.key,
      required this.page,
      required this.title,
      required this.serviceIndex}) {
    pageList = [
      page,
      const SearchPage(),
      const CartPage(),
      const FavoritePage(),
    ];
  }
  int serviceIndex;
  Widget page;
  String title;
  bool isFirstTime = true;
  late List<Widget> pageList;

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationBarNotifier>(
        builder: (consumerContext, navNotifier, child) {
      navNotifier.serviceIndex = serviceIndex;
      return Scaffold(
        body: getPage(navNotifier),
        appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 224, 215, 215),
            automaticallyImplyLeading: false,
            centerTitle: true,
            title: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            )),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context);
            navNotifier.resetIndex();
          },
          child: const Icon(Icons.menu),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: Container(
          height: MediaQuery.of(context).size.height * 0.07,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 224, 215, 215),
            boxShadow: [
              BoxShadow(
                blurRadius: 20,
                color: Colors.black.withOpacity(.3),
              )
            ],
          ),
          child: SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
              child: GNav(
                rippleColor: Colors.grey[300]!,
                hoverColor: Colors.grey[100]!,
                gap: 8,
                activeColor: Colors.deepPurple,
                iconSize: 24,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                duration: const Duration(milliseconds: 400),
                tabBackgroundColor: Colors.grey[100]!,
                color: Colors.black,
                selectedIndex: navNotifier.pageIndex,
                tabs: [
                  GButton(
                    onPressed: () {
                      navNotifier.pageIndex = 0;
                    },
                    icon: Icons.home,
                    text: 'Home',
                  ),
                  GButton(
                    onPressed: () {
                      navNotifier.pageIndex = 1;
                    },
                    icon: Icons.search,
                    text: 'Search',
                  ),
                  GButton(
                    onPressed: () {
                      navNotifier.pageIndex = 2;
                    },
                    icon: Icons.trolley,
                    text: 'Cart',
                  ),
                  GButton(
                    onPressed: () {
                      navNotifier.pageIndex = 3;
                    },
                    icon: Icons.favorite,
                    iconColor: Colors.red,
                    text: 'Favorites',
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  Widget getPage(NavigationBarNotifier navNotifier) {
    if (isFirstTime) {
      isFirstTime = false;
      return pageList[0];
    } else {
      return pageList[navNotifier.pageIndex];
    }
  }
}

import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import 'package:nav_bar/cart.dart';
import 'package:nav_bar/favourite.dart';
import 'package:nav_bar/notification.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);
  int _counterCart = 0;
  int _counterNotification = 0;
  int _counterFavourite = 0;

  List<Widget> _buildScreens() {
    return [
      CartScreen(
        onCounterChange: (counter) {
          setState(() {
            _counterCart = counter;
          });
        },
      ),
      NotificationScreen(
        onCounterChange: (counter) {
          setState(() {
            _counterNotification = counter;
          });
        },
      ),
      FavouriteScreen(
        onCounterChange: (counter) {
          setState(() {
            _counterFavourite = counter;
          });
        },
      ),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Badge(
          label: Text('$_counterCart'),
          child: const Icon(Icons.shopping_cart),
        ),
        title: ("Cart"),
      ),
      PersistentBottomNavBarItem(
        icon: Badge(
          label: Text('$_counterNotification'),
          child: const Icon(Icons.notifications),
        ),
        title: ("Notification"),
      ),
      PersistentBottomNavBarItem(
        icon: Badge(
          label: Text('$_counterFavourite'),
          child: const Icon(Icons.favorite_border),
        ),
        title: ("Favourite"),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),

      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style3, // Choose the nav bar style with this property.
    );
  }
}

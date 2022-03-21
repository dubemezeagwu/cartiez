import 'package:cartiez/utils/constants.dart';
import 'package:flutter/material.dart';

import '../routes/pages/presentation/checkout_cart_page.dart';
import '../routes/pages/presentation/home_page.dart';
import '../routes/pages/presentation/profile_page.dart';

// Bottom Navbar for the app.
class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedPageIndex = 0;

  // When onTapped is clicked, it sets a state by passing the index and updating the selectedIndex value
  void onTapped (int index){
    setState(() {
      _selectedPageIndex = index;
    });
  }

  // List of Routes
  final List<Widget> _children = [
    HomePage(),
    CheckoutCartPage(),
    ProfilePage(),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _children[_selectedPageIndex],
        extendBody: true,
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black.withOpacity(0.1),
          elevation: 0,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.add_shopping_cart_rounded),label: "Checkout"),
            BottomNavigationBarItem(icon: Icon(Icons.person),label: "Profile"),
          ],
          onTap: onTapped,
          currentIndex: _selectedPageIndex,
          showUnselectedLabels: false,
          selectedItemColor: Constants.primaryColor,)
    );

  }
}
import 'package:cartiez/utils/size_config.dart';
import 'package:flutter/material.dart';
import '../routes/pages/presentation/checkout_cart_page.dart';
import '../routes/pages/presentation/home_page.dart';
import '../routes/pages/presentation/profile_page.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  State<CustomBottomNavigationBar> createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedPageIndex = 0;

  // List of Routes
  final List<Widget> _childrenScreen = [
    HomePage(),
    CheckoutCartPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: _childrenScreen[_selectedPageIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [Color(0xFF6D90B9),Color(0xFFBBC7DC)])
        ),
          child: BottomAppBar(
            elevation: 0,
            color: Colors.transparent,
            child: SizedBox(
              width: SizeConfig.screenWidth,
              height: getProportionateScreenHeight(60),
              child: Padding(
                padding: EdgeInsets.only(left: 25.0, right: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconBottomBar(
                      text: "Home",
                      icon: Icons.home,
                      isSelected: _selectedPageIndex == 0,
                      onPressed: (){
                        setState(() {
                          _selectedPageIndex = 0;
                        });
                      }
                    ),
                    IconBottomBar(
                        text: "Cart",
                        icon: Icons.shopping_cart,
                        isSelected: _selectedPageIndex == 1,
                        onPressed: (){
                          setState(() {
                            _selectedPageIndex = 1;
                          });
                        }
                    ),
                    IconBottomBar(
                        text: "Profile",
                        icon: Icons.person,
                        isSelected: _selectedPageIndex == 2,
                        onPressed: (){
                          setState(() {
                            _selectedPageIndex = 2;
                          });
                        }
                    ),
                  ],
                ),
              ),
            ),
          ),
      ),
    );
  }
}

class IconBottomBar extends StatelessWidget {
  final String text;
  final IconData icon;
  final bool isSelected;
  final Function() onPressed;
  const IconBottomBar({Key? key,
    required this.text,
    required this.icon,
    required this.isSelected,
    required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
            onPressed: onPressed,
            icon: Icon(
          icon, size: 25, color: isSelected ? Colors.black : Colors.grey)
        ),
        Text(text, style: TextStyle(
          fontSize: 12,
          height: .1,
          color: isSelected ? Colors.black : Colors.grey
        ),)
      ],
    );
  }
}


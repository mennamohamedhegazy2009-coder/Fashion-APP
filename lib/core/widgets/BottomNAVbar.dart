import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_application_1/features/home/presentation/Home.dart';
import 'package:flutter_application_1/features/cart/presentation/cartscreen.dart';
import 'package:flutter_application_1/features/favourite/presentation/Favoritescreen.dart';
import 'package:flutter_application_1/features/search/presentation/searshscreen.dart'; 
import 'package:flutter_application_1/features/setting/presentation/setting.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});
  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}
class _BottomNavBarState extends State<BottomNavBar> {
  int _page = 0;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  final List<Widget> _screens = [
         HomeScreen(),
        FavoriteScreen(), 
         ProductDetailsScreen(),
         SearchScreen(),
        SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true, 
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: _page, 
        height: 60,
        items: const <Widget>[
          Icon(Icons.home_outlined, size: 30, color: Color(0xFFE87E87)),
          Icon(Icons.favorite_outline, size: 30, color: Color(0xFFE87E87)),
          Icon(Icons.shopping_cart_outlined, size: 30, color: Color(0xFFE87E87)),
          Icon(Icons.search_outlined, size: 30, color: Color(0xFFE87E87)),
          Icon(Icons.settings_outlined, size: 30, color: Color(0xFFE87E87)),
        ],
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        backgroundColor:Color.fromARGB(255, 243, 170, 176),
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 300),
        onTap: (index) {
          if (_page != index) {
            setState(() {
              _page = index;
            });
          }
        },
      ),
      body: IndexedStack(
        index: _page,
        children: _screens,
      ),
    );
  }
}
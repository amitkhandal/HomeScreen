import 'package:flutter/material.dart';

class BottomNavMenu extends StatefulWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavMenu({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  State<BottomNavMenu> createState() => _BottomNavMenuState();
}

class _BottomNavMenuState extends State<BottomNavMenu> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: widget.currentIndex,
      onTap: widget.onTap,
      backgroundColor: Colors.white,
      selectedItemColor: const Color(0xff0F6A6C),
      unselectedItemColor: Colors.grey,
      elevation: 8,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: 'Wishlist',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    );
  }
}


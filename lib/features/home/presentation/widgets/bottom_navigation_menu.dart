import 'package:flutter/material.dart';

class BottomNavigationMenu extends StatefulWidget {
  final int initialIndex;
  final Function(int) onTabChanged;

  const BottomNavigationMenu({
    super.key,
    this.initialIndex = 0,
    required this.onTabChanged,
  });

  @override
  State<BottomNavigationMenu> createState() => _BottomNavigationMenuState();
}

class _BottomNavigationMenuState extends State<BottomNavigationMenu> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    widget.onTabChanged(index);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -2),
          )
        ],
      ),
      child: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: Colors.white,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xff0F9BA5),
        unselectedItemColor: const Color(0xffB0B3B9),
        selectedLabelStyle: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w500,
        ),
        items: [
          BottomNavigationBarItem(
            icon: _buildNavIcon(
              icon: Icons.home,
              isSelected: _selectedIndex == 0,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: _buildNavIcon(
              icon: Icons.assignment,
              isSelected: _selectedIndex == 1,
            ),
            label: 'Reports',
          ),
          BottomNavigationBarItem(
            icon: _buildNavIcon(
              icon: Icons.medical_services,
              isSelected: _selectedIndex == 2,
            ),
            label: 'Lab Tests',
          ),
          BottomNavigationBarItem(
            icon: _buildNavIcon(
              icon: Icons.calendar_month,
              isSelected: _selectedIndex == 3,
            ),
            label: 'Bookings',
          ),
          BottomNavigationBarItem(
            icon: _buildNavIcon(
              icon: Icons.person,
              isSelected: _selectedIndex == 4,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget _buildNavIcon({
    required IconData icon,
    required bool isSelected,
  }) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: isSelected
            ? const Color(0xff0F9BA5).withOpacity(0.1)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(
        icon,
        size: 24,
        color: isSelected ? const Color(0xff0F9BA5) : const Color(0xffB0B3B9),
      ),
    );
  }
}


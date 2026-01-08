import 'package:flutter/material.dart';

class QuickAccessMenu extends StatelessWidget {
  const QuickAccessMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Quick Access',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 16),
          // Grid of quick access items
          GridView.count(
            crossAxisCount: 5,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: 12,
            crossAxisSpacing: 8,
            children: [
              _QuickAccessItem(
                icon: Icons.health_and_safety,
                label: 'Health',
                onTap: () => _showToast(context, 'Health selected'),
              ),
              _QuickAccessItem(
                icon: Icons.local_hospital,
                label: 'Lab Test',
                onTap: () => _showToast(context, 'Lab Test selected'),
              ),
              _QuickAccessItem(
                icon: Icons.medical_services,
                label: 'Doctor',
                onTap: () => _showToast(context, 'Doctor selected'),
              ),
              _QuickAccessItem(
                icon: Icons.healing,
                label: 'Medicine',
                onTap: () => _showToast(context, 'Medicine selected'),
              ),
              _QuickAccessItem(
                icon: Icons.vaccines,
                label: 'Vaccine',
                onTap: () => _showToast(context, 'Vaccine selected'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showToast(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 1),
      ),
    );
  }
}

class _QuickAccessItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _QuickAccessItem({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xff0F6A6C).withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: const Color(0xff0F6A6C),
              size: 24,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}


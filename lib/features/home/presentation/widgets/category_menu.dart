import 'package:flutter/material.dart';

class CategoryMenu extends StatelessWidget {
  const CategoryMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      {'icon': Icons.local_hospital, 'label': 'Diagnostics', 'color': Color(0xFFFF6B6B)},
      {'icon': Icons.medical_services, 'label': 'Doctors', 'color': Color(0xFF4ECDC4)},
      {'icon': Icons.local_pharmacy, 'label': 'Pharmacy', 'color': Color(0xFF45B7D1)},
      {'icon': Icons.healing, 'label': 'Wellness', 'color': Color(0xFFFFA07A)},
    ];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Categories',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 12),
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
            ),
            itemCount: categories.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final category = categories[index];
              return _CategoryItem(
                icon: category['icon'] as IconData,
                label: category['label'] as String,
                color: category['color'] as Color,
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('${category['label']} selected')),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

class _CategoryItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  const _CategoryItem({
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: color.withOpacity(0.3),
                width: 1,
              ),
            ),
            child: Icon(
              icon,
              color: color,
              size: 28,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}


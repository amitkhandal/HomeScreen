import 'package:flutter/material.dart';

class HealthPackagesGrid extends StatelessWidget {
  const HealthPackagesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> packages = [
      {
        'title': 'Full Body Checkup',
        'color': const Color(0xffB3E5FC),
        'icon': Icons.health_and_safety,
        'items': 45,
      },
      {
        'title': 'Diabetes',
        'color': const Color(0xffF8BBD0),
        'icon': Icons.favorite,
        'items': 12,
      },
      {
        'title': 'Hair & Skin Care',
        'color': const Color(0xffC8E6C9),
        'icon': Icons.spa,
        'items': 28,
      },
      {
        'title': 'Vitamins',
        'color': const Color(0xffFFE0B2),
        'icon': Icons.spa,
        'items': 18,
      },
      {
        'title': 'Fever & Infection',
        'color': const Color(0xffC8E6C9),
        'icon': Icons.local_hospital,
        'items': 22,
      },
      {
        'title': 'Thyroid',
        'color': const Color(0xffF8BBD0),
        'icon': Icons.science,
        'items': 8,
      },
    ];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          const Text(
            'Doctor-Curated Health Checkup Packages',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xff0F0F0F),
            ),
          ),
          const SizedBox(height: 16),
          // GridView
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.85,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
            itemCount: packages.length,
            itemBuilder: (context, index) {
              return _HealthPackageCard(
                package: packages[index],
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Tapped: ${packages[index]['title']}'),
                      duration: const Duration(milliseconds: 800),
                    ),
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

class _HealthPackageCard extends StatelessWidget {
  final Map<String, dynamic> package;
  final VoidCallback onTap;

  const _HealthPackageCard({
    required this.package,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: package['color'],
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 8,
              offset: const Offset(0, 2),
            )
          ],
        ),
        child: Stack(
          children: [
            // Background Pattern
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.white.withOpacity(0.3),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
            // Content
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Icon
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      package['icon'],
                      color: const Color(0xff0F9BA5),
                      size: 28,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Title
                  Expanded(
                    child: Text(
                      package['title'],
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff0F0F0F),
                        height: 1.2,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Test Count
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      '${package['items']} Tests',
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff0F9BA5),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


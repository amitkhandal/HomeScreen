import 'package:flutter/material.dart';

class HolisticWomensCareGridView extends StatelessWidget {
  const HolisticWomensCareGridView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> womensCategories = [
      {
        'title': 'PCOS',
        'color': const Color(0xffB3DFD8),
        'icon': Icons.female,
        'iconColor': const Color(0xff4A8A80),
      },
      {
        'title': 'Fertility',
        'color': const Color(0xffFFD4D4),
        'icon': Icons.favorite,
        'iconColor': const Color(0xffD97070),
      },
      {
        'title': 'Bad Obstetric\nHistory',
        'color': const Color(0xffC8E6D8),
        'icon': Icons.health_and_safety,
        'iconColor': const Color(0xff5FA894),
      },
      {
        'title': 'Pregnancy\nTest',
        'color': const Color(0xffFFE5CC),
        'icon': Icons.pregnant_woman,
        'iconColor': const Color(0xffD8975F),
      },
      {
        'title': 'Pregnancy\nPackages',
        'color': const Color(0xffD5A8D8),
        'icon': Icons.child_care,
        'iconColor': const Color(0xff8B5A9B),
      },
      {
        'title': 'Pregnancy\nUltrasound',
        'color': const Color(0xffFFD9B3),
        'icon': Icons.image,
        'iconColor': const Color(0xffD9984A),
      },
      {
        'title': 'Postpartum\nCare',
        'color': const Color(0xffFFEDD5),
        'icon': Icons.spa,
        'iconColor': const Color(0xffE8B87B),
      },
      {
        'title': 'Menopause',
        'color': const Color(0xffD4CDE8),
        'icon': Icons.wc,
        'iconColor': const Color(0xff8B7EA8),
      },
    ];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          const Text(
            'Holistic Women\'s Care',
            style: TextStyle(
              fontSize: 12,
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
              crossAxisCount: 4,
              childAspectRatio: 0.9,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
            itemCount: womensCategories.length,
            itemBuilder: (context, index) {
              return _WomensCareCard(
                category: womensCategories[index],
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Selected: ${womensCategories[index]['title'].replaceAll('\n', ' ')}',
                      ),
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

class _WomensCareCard extends StatelessWidget {
  final Map<String, dynamic> category;
  final VoidCallback onTap;

  const _WomensCareCard({
    required this.category,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: category['color'],
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Colors.grey.withOpacity(0.15),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 6,
              offset: const Offset(0, 2),
            )
          ],
        ),
        child: Stack(
          children: [
            // Decorative background circle
            Positioned(
              right: -15,
              top: -15,
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
            ),
            // Main Content
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Icon Container
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: category['iconColor'].withOpacity(0.15),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      category['icon'],
                      color: category['iconColor'],
                      size: 28,
                    ),
                  ),
                  const SizedBox(height:5),
                  // Title
                  Text(
                    category['title'],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 8,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff0F0F0F),
                      height: 1.3,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
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


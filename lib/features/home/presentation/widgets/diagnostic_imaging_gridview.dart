import 'package:flutter/material.dart';

class DiagnosticImagingGridView extends StatelessWidget {
  const DiagnosticImagingGridView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> imagingCategories = [
      {
        'title': 'CT Scan',
        'color': const Color(0xffB3D9F2),
        'icon': Icons.image_search,
        'iconColor': const Color(0xff4A8AC8),
        'hasButton': true,
      },
      {
        'title': 'ECG',
        'color': const Color(0xffD4D9E8),
        'icon': Icons.favorite,
        'iconColor': const Color(0xff6B5BA8),
        'hasButton': true,
      },
      {
        'title': 'X-Ray',
        'color': const Color(0xffE8D4D9),
        'icon': Icons.radio_button_unchecked,
        'iconColor': const Color(0xffC85A5A),
        'hasButton': true,
      },
      {
        'title': 'Ultrasound',
        'color': const Color(0xffC8E8D9),
        'icon': Icons.waves,
        'iconColor': const Color(0xff5AA88B),
        'hasButton': true,
      },
      {
        'title': 'MRI',
        'color': const Color(0xffD4D9E8),
        'icon': Icons.scanner,
        'iconColor': const Color(0xff6B5BA8),
        'hasButton': true,
      },
      {
        'title': 'X-Ray',
        'color': const Color(0xffE8D4D9),
        'icon': Icons.radio_button_unchecked,
        'iconColor': const Color(0xffC85A5A),
        'hasButton': true,
      },
    ];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          const Text(
            'X-Ray, CT Scan and MRI',
            style: TextStyle(
              fontSize: 16,
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
              crossAxisCount: 3,
              childAspectRatio: 0.95,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
            itemCount: imagingCategories.length,
            itemBuilder: (context, index) {
              return _ImagingServiceCard(
                category: imagingCategories[index],
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Selected: ${imagingCategories[index]['title']}',
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

class _ImagingServiceCard extends StatelessWidget {
  final Map<String, dynamic> category;
  final VoidCallback onTap;

  const _ImagingServiceCard({
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
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Colors.grey.withOpacity(0.1),
            width: 1,
          ),
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
            // Decorative background circle
            Positioned(
              right: -20,
              bottom: -20,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),
            // Main Content
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Icon
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      category['icon'],
                      color: category['iconColor'],
                      size: 32,
                    ),
                  ),
                  // Content Section
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title
                      Text(
                        category['title'],
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff0F0F0F),
                        ),
                      ),
                      const SizedBox(height: 5),
                      // Button
                      GestureDetector(
                        onTap: onTap,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: category['iconColor'],
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: const Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 10,
                          ),
                        ),
                      ),
                    ],
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


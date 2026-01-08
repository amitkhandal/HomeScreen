import 'package:flutter/material.dart';

class TopBookedPackagesListView extends StatelessWidget {
  const TopBookedPackagesListView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> packages = [
      {
        'title': 'Fit India Full Body Checkup with Vitamin Screening (For Male)',
        'subtitle': 'Fit India Full Body Checkup with Vitamin Screening',
        'tests': 93,
        'price': 1050,
        'originalPrice': 7600,
        'discount': 'Or Pay ₹ 860 with Annual plan',
        'fastingRequired': 12,
        'reportsInHours': 24,
        'color': const Color(0xff0F9BA5),
        'icon': Icons.favorite,
      },
      {
        'title': 'Fit India Full Body Checkup with Vitamin Screening (For Female)',
        'subtitle': 'Fit India Full Body Checkup with Vitamin Screening',
        'tests': 93,
        'price': 1050,
        'originalPrice': 7600,
        'discount': 'Or Pay ₹ 860 with Annual plan',
        'fastingRequired': 12,
        'reportsInHours': 24,
        'color': const Color(0xff0F9BA5),
        'icon': Icons.favorite,
      },
      {
        'title': 'Advanced Full Body Checkup with Wellness Profile',
        'subtitle': 'Advanced Full Body Checkup',
        'tests': 110,
        'price': 1500,
        'originalPrice': 8000,
        'discount': 'Or Pay ₹ 1200 with Annual plan',
        'fastingRequired': 10,
        'reportsInHours': 24,
        'color': const Color(0xff00897B),
        'icon': Icons.health_and_safety,
      },
      {
        'title': 'Executive Health Checkup Package',
        'subtitle': 'Executive Health Checkup',
        'tests': 75,
        'price': 2500,
        'originalPrice': 5000,
        'discount': 'Or Pay ₹ 2000 with Annual plan',
        'fastingRequired': 8,
        'reportsInHours': 12,
        'color': const Color(0xff1565C0),
        'icon': Icons.business,
      },
    ];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with title and button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Top Booked Health Checkup Packages',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff0F0F0F),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: const Color(0xff0F9BA5),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'Packages',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Horizontal ListView
          SizedBox(
            height: 320,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: packages.length,
              itemBuilder: (context, index) {
                return _TopBookedPackageCard(
                  package: packages[index],
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Booked: ${packages[index]['subtitle']}'),
                        duration: const Duration(milliseconds: 800),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _TopBookedPackageCard extends StatelessWidget {
  final Map<String, dynamic> package;
  final VoidCallback onTap;

  const _TopBookedPackageCard({
    required this.package,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 280,
        margin: const EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Colors.grey.withOpacity(0.2),
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
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header with icon and tag
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // For Male & Female label
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.15),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: const Text(
                                'For Male & Female',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff666666),
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            // Title
                            Text(
                              package['subtitle'],
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff0F0F0F),
                                height: 1.3,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      // Icon
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: package['color'].withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(
                          package['icon'],
                          color: package['color'],
                          size: 24,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  // Test count with icon
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 3,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xff4CAF50).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.check_circle,
                              color: Color(0xff4CAF50),
                              size: 14,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '${package['tests']} Test',
                              style: const TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff4CAF50),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      // Fasting required
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 3,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xff2196F3).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.schedule,
                              color: Color(0xff2196F3),
                              size: 14,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '${package['fastingRequired']}hrs Fasting',
                              style: const TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff2196F3),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      // Reports in hours
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 3,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xffFF9800).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.timer,
                              color: Color(0xffFF9800),
                              size: 14,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '${package['reportsInHours']}hrs',
                              style: const TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                                color: Color(0xffFF9800),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  // Divider
                  Divider(
                    color: Colors.grey.withOpacity(0.2),
                    height: 1,
                  ),
                  const SizedBox(height: 12),
                  // Price section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Original price (strikethrough)
                          Text(
                            '₹${package['originalPrice']}',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                          const SizedBox(height: 2),
                          // Current price
                          Text(
                            '₹${package['price']}',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff0F0F0F),
                            ),
                          ),
                          const SizedBox(height: 2),
                          // Plan info
                          Text(
                            package['discount'],
                            style: const TextStyle(
                              fontSize: 10,
                              color: Color(0xff999999),
                            ),
                          ),
                        ],
                      ),
                      // Book Now button
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: package['color'],
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(
                              'Book Now',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(width: 4),
                            const Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                              size: 14,
                            ),
                          ],
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


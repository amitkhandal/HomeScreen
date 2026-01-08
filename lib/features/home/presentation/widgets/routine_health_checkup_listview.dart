import 'package:flutter/material.dart';

class RoutineHealthCheckupListView extends StatelessWidget {
  const RoutineHealthCheckupListView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> ageGroups = [
      {
        'ageRange': 'Under 15 yrs',
        'color': const Color(0xffF5E6D3),
        'icon': Icons.child_care,
        'iconColor': const Color(0xffC17D5E),
      },
      {
        'ageRange': '15-30 yrs',
        'color': const Color(0xffE8D5F2),
        'icon': Icons.fitness_center,
        'iconColor': const Color(0xff7B5BA1),
      },
      {
        'ageRange': '30-45 yrs',
        'color': const Color(0xffFFF0D9),
        'icon': Icons.person,
        'iconColor': const Color(0xffD4A574),
      },
      {
        'ageRange': '45-60 yrs',
        'color': const Color(0xffFFE8D6),
        'icon': Icons.accessibility,
        'iconColor': const Color(0xffD89B6A),
      },
      {
        'ageRange': 'Above 60',
        'color': const Color(0xffD4F1D4),
        'icon': Icons.elderly,
        'iconColor': const Color(0xff6BA86B),
      },
    ];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          const Text(
            'Routine Health Checkup for Men',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xff0F0F0F),
            ),
          ),
          const SizedBox(height: 16),
          // Horizontal ListView
          SizedBox(
            height: 140,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: ageGroups.length,
              itemBuilder: (context, index) {
                return _AgeGroupCard(
                  ageGroup: ageGroups[index],
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Selected: ${ageGroups[index]['ageRange']}',
                        ),
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

class _AgeGroupCard extends StatelessWidget {
  final Map<String, dynamic> ageGroup;
  final VoidCallback onTap;

  const _AgeGroupCard({
    required this.ageGroup,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100,
        margin: const EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          color: ageGroup['color'],
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Colors.grey.withOpacity(0.2),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: ageGroup['iconColor'].withOpacity(0.1),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Icon(
                ageGroup['icon'],
                color: ageGroup['iconColor'],
                size: 32,
              ),
            ),
            const SizedBox(height: 10),
            // Age range text
            Text(
              ageGroup['ageRange'],
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: Color(0xff0F0F0F),
                height: 1.3,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}


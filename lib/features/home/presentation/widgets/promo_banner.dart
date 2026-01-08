import 'package:flutter/material.dart';

class PromoBanner extends StatefulWidget {
  const PromoBanner({super.key});

  @override
  State<PromoBanner> createState() => _PromoBannerState();
}

class _PromoBannerState extends State<PromoBanner> {
  late PageController _pageController;
  int _currentPage = 0;

  final List<Map<String, dynamic>> promos = [
    {
      'title': 'Get 50% Off',
      'subtitle': 'on your first lab test',
      'color': const Color(0xff0F6A6C),
      'icon': Icons.local_offer,
    },
    {
      'title': 'Free Home Collection',
      'subtitle': 'for orders above Rs. 500',
      'color': const Color(0xff1E8A8C),
      'icon': Icons.home,
    },
    {
      'title': 'Expert Consultation',
      'subtitle': 'with top doctors 24/7',
      'color': const Color(0xff2C6B6D),
      'icon': Icons.medical_services,
    },
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        children: [
          SizedBox(
            height: 160,
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemCount: promos.length,
              itemBuilder: (context, index) {
                return _PromoBannerCard(
                  promo: promos[index],
                );
              },
            ),
          ),
          const SizedBox(height: 12),
          // Dot Indicators
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              promos.length,
              (index) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: _currentPage == index ? 24 : 8,
                height: 8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: _currentPage == index
                      ? const Color(0xff0F6A6C)
                      : Colors.grey.withOpacity(0.3),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PromoBannerCard extends StatelessWidget {
  final Map<String, dynamic> promo;

  const _PromoBannerCard({required this.promo});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        color: promo['color'],
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          )
        ],
      ),
      child: Stack(
        children: [
          // Gradient overlay
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.white.withOpacity(0.1),
                  Colors.transparent,
                ],
              ),
            ),
          ),
          // Content
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                // Icon
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    promo['icon'],
                    color: Colors.white,
                    size: 32,
                  ),
                ),
                const SizedBox(width: 16),
                // Text
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        promo['title'],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        promo['subtitle'],
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.9),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


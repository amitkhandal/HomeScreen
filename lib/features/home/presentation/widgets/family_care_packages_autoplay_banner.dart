import 'package:flutter/material.dart';

class FamilyCarePackagesAutoPlayBanner extends StatefulWidget {
  const FamilyCarePackagesAutoPlayBanner({super.key});

  @override
  State<FamilyCarePackagesAutoPlayBanner> createState() =>
      _FamilyCarePackagesAutoPlayBannerState();
}

class _FamilyCarePackagesAutoPlayBannerState
    extends State<FamilyCarePackagesAutoPlayBanner>
    with TickerProviderStateMixin {
  late PageController _pageController;
  int _currentPage = 0;
  late AnimationController _autoPlayController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    _autoPlayController =
        AnimationController(vsync: this, duration: const Duration(seconds: 4));
    _autoPlayController.repeat();
    _startAutoPlay();
  }

  void _startAutoPlay() {
    _autoPlayController.addListener(() {
      if (_autoPlayController.isCompleted) {
        _nextPage();
        _autoPlayController.forward(from: 0.0);
      }
    });
  }

  void _nextPage() {
    if (_pageController.hasClients) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }
  }

  void _previousPage() {
    if (_pageController.hasClients) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    _autoPlayController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> familyPackages = [
      {
        'title': 'Get Expert\nDiabetes Care',
        'subtitle': 'Annual Health Checkup\nAdvance',
        'originalPrice': '₹ 7900/-',
        'discountPercent': '80%',
        'price': 'Rs. 1500/-',
        'bgColor': const Color(0xff004B5E),
        'accentColor': const Color(0xff7C5DFE),
        'hasImage': true,
        'icon': Icons.local_hospital,
      },
      {
        'title': 'Family\nWellness Package',
        'subtitle': 'Comprehensive Health\nCheckup',
        'originalPrice': '₹ 8500/-',
        'discountPercent': '75%',
        'price': 'Rs. 2000/-',
        'bgColor': const Color(0xff7C5DFE),
        'accentColor': const Color(0xff004B5E),
        'hasImage': true,
        'icon': Icons.groups_2,
      },
      {
        'title': 'Get Expert\nCardiology Care',
        'subtitle': 'Heart Health Checkup\nPackage',
        'originalPrice': '₹ 6500/-',
        'discountPercent': '70%',
        'price': 'Rs. 1800/-',
        'bgColor': const Color(0xff00A86B),
        'accentColor': const Color(0xffFFC700),
        'hasImage': true,
        'icon': Icons.favorite,
      },
    ];

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          const Text(
            'Family Care Packages',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xff0F0F0F),
            ),
          ),
          const SizedBox(height: 12),
          // AutoPlay Banner
          SizedBox(
            height: 180,
            child: Stack(
              children: [
                PageView.builder(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index % familyPackages.length;
                    });
                    // Reset animation when user manually scrolls
                    _autoPlayController.forward(from: 0.0);
                  },
                  itemCount: familyPackages.length,
                  itemBuilder: (context, index) {
                    final package = familyPackages[index];
                    return _FamilyCarePackageCard(package: package);
                  },
                ),
                // Left Arrow Button
                Positioned(
                  left: 0,
                  top: 0,
                  bottom: 0,
                  child: Center(
                    child: GestureDetector(
                      onTap: _previousPage,
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    ),
                  ),
                ),
                // Right Arrow Button
                Positioned(
                  right: 0,
                  top: 0,
                  bottom: 0,
                  child: Center(
                    child: GestureDetector(
                      onTap: _nextPage,
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          // Dot Indicators
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                familyPackages.length,
                (index) => GestureDetector(
                  onTap: () {
                    _pageController.animateToPage(
                      index,
                      duration: const Duration(milliseconds: 600),
                      curve: Curves.easeInOut,
                    );
                    _autoPlayController.forward(from: 0.0);
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: _currentPage == index ? 24 : 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: _currentPage == index
                          ? const Color(0xff004B5E)
                          : const Color(0xff004B5E).withOpacity(0.3),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FamilyCarePackageCard extends StatelessWidget {
  final Map<String, dynamic> package;

  const _FamilyCarePackageCard({required this.package});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Selected: ${package['title'].replaceAll('\n', ' ')}'),
            duration: const Duration(milliseconds: 800),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              package['bgColor'],
              package['bgColor'].withOpacity(0.8),
            ],
          ),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 12,
              offset: const Offset(0, 4),
            )
          ],
        ),
        child: Stack(
          children: [
            // Background decorative circles
            Positioned(
              right: -40,
              top: -40,
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  color: package['accentColor'].withOpacity(0.1),
                  borderRadius: BorderRadius.circular(75),
                ),
              ),
            ),
            Positioned(
              right: 20,
              bottom: -30,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: package['accentColor'].withOpacity(0.08),
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),
            // Main Content
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Left Content
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Title
                        Text(
                          package['title'],
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            height: 1.2,
                          ),
                        ),
                        // Subtitle
                        Text(
                          package['subtitle'],
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.white.withOpacity(0.85),
                            height: 1.3,
                          ),
                        ),
                        // Price Section
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Original Price (strikethrough)
                            Text(
                              package['originalPrice'],
                              style: TextStyle(
                                fontSize: 11,
                                color: Colors.white.withOpacity(0.7),
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                            // Discount and Current Price
                            Row(
                              children: [
                                Text(
                                  package['price'],
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: package['accentColor'],
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Text(
                                    '${package['discountPercent']} OFF',
                                    style: const TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  // Right Image/Icon Placeholder
                  Container(
                    width: 90,
                    height: 140,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Icon(
                        package['icon'],
                        color: Colors.white.withOpacity(0.6),
                        size: 50,
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


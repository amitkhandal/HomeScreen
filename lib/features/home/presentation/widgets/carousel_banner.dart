import 'package:flutter/material.dart';

class CarouselBanner extends StatefulWidget {
  const CarouselBanner({super.key});

  @override
  State<CarouselBanner> createState() => _CarouselBannerState();
}

class _CarouselBannerState extends State<CarouselBanner> {
  late PageController _pageController;
  int _currentPage = 0;

  final List<Map<String, dynamic>> banners = [
    {
      'title': 'Book Via Doctor Prescription',
      'subtitle': 'Our experts will book the test for you per your prescription.',
      'buttonText': 'Upload Now',
      'color': const Color(0xff0F9BA5),
      'imageAsset': 'assets/images/headerBackground.svg',
    },
    {
      'title': 'Fast & Reliable Testing',
      'subtitle': 'Get results within 24 hours with our expert lab technicians.',
      'buttonText': 'Book Now',
      'color': const Color(0xff1E8A8C),
      'imageAsset': 'assets/images/x_ray_background.png',
    },
    {
      'title': 'Home Sample Collection',
      'subtitle': 'Free home collection for all tests above Rs. 500.',
      'buttonText': 'Learn More',
      'color': const Color(0xff2C7A7E),
      'imageAsset': 'assets/images/headerBackground.svg',
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

  void _onBannerTapped(int index) {
    // Handle banner tap action
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Tapped on ${banners[index]['title']}')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        children: [
          // Carousel
          SizedBox(
            height: 200,
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemCount: banners.length,
              itemBuilder: (context, index) {
                return _CarouselBannerCard(
                  banner: banners[index],
                  onTap: () => _onBannerTapped(index),
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          // Dot Indicators
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              banners.length,
              (index) => GestureDetector(
                onTap: () {
                  _pageController.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: _currentPage == index ? 24 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: _currentPage == index
                        ? const Color(0xff0F9BA5)
                        : Colors.grey.withOpacity(0.3),
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

class _CarouselBannerCard extends StatelessWidget {
  final Map<String, dynamic> banner;
  final VoidCallback onTap;

  const _CarouselBannerCard({
    required this.banner,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          color: banner['color'],
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 4),
            )
          ],
        ),
        child: Stack(
          children: [
            // Gradient overlay
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.white.withOpacity(0.05),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
            // Content Row
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  // Text Content
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Title
                        Text(
                          banner['title'],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            height: 1.2,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 8),
                        // Subtitle
                        Text(
                          banner['subtitle'],
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.85),
                            fontSize: 11,
                            height: 1.3,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 12),
                        // Button
                        ElevatedButton(
                          onPressed: onTap,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: banner['color'],
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            elevation: 0,
                          ),
                          child: Text(
                            banner['buttonText'],
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  // Image/Icon on right
                  Expanded(
                    flex: 1,
                    child: Center(
                      child: Container(
                        width: 100,
                        height: 120,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          Icons.medical_services,
                          color: Colors.white.withOpacity(0.7),
                          size: 48,
                        ),
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


import 'package:flutter/material.dart';
import '../../domain/entities/home_banner.dart';

class BannerSlider extends StatelessWidget {
  final List<HomeBanner> banners;
  const BannerSlider({super.key, required this.banners});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: PageView.builder(
        itemCount: banners.length,
        itemBuilder: (_, i) => Padding(
          padding: const EdgeInsets.all(8),
          child: Image.network(banners[i].image, fit: BoxFit.cover),
        ),
      ),
    );
  }
}

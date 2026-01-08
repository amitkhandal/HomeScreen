import '../../domain/entities/home_banner.dart';

class HomeBannerModel extends HomeBanner {
  HomeBannerModel({required super.title, required super.image});

  factory HomeBannerModel.fromJson(Map<String, dynamic> json) {
    return HomeBannerModel(
      title: json['title'],
      image: json['image'],
    );
  }
}

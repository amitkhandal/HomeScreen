import '../../domain/entities/home_banner.dart';
import '../../domain/repository/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  @override
  Future<List<HomeBanner>> getBanners() async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      HomeBanner(title: 'Banner 1', image: 'https://via.placeholder.com/300'),
      HomeBanner(title: 'Banner 2', image: 'https://via.placeholder.com/300'),
    ];
  }
}

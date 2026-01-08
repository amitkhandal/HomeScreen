import '../repository/home_repository.dart';

class GetHomeBanners {
  final HomeRepository repository;

  GetHomeBanners(this.repository);

  Future call() {
    return repository.getBanners();
  }
}

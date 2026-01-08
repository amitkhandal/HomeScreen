import '../../domain/entities/home_banner.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}
class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<HomeBanner> banners;
  HomeLoaded(this.banners);
}

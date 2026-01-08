import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/get_home_banners.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetHomeBanners getHomeBanners;

  HomeBloc(this.getHomeBanners) : super(HomeInitial()) {
    on<LoadHome>((event, emit) async {
      emit(HomeLoading());
      final banners = await getHomeBanners();
      emit(HomeLoaded(banners));
    });
  }
}

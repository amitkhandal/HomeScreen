import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/get_products.dart';
import 'product_event.dart';
import 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetProducts getProducts;

  ProductBloc(this.getProducts) : super(ProductInitial()) {
    on<LoadProducts>((event, emit) async {
      try {
        emit(ProductLoading());
        final products = await getProducts();
        emit(ProductLoaded(products));
      } catch (e) {
        emit(ProductError(e.toString()));
      }
    });
  }
}


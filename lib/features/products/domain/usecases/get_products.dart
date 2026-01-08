import '../repository/product_repository.dart';

class GetProducts {
  final ProductRepository repository;

  GetProducts(this.repository);

  Future call() {
    return repository.getProducts();
  }
}


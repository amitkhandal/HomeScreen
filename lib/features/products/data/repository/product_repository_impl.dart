import '../../domain/entities/product.dart';
import '../../domain/repository/product_repository.dart';
import '../models/product_model.dart';

class ProductRepositoryImpl implements ProductRepository {
  @override
  Future<List<Product>> getProducts() async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));

    // Mock product data
    return [
      ProductModel(
        id: '1',
        name: 'Laptop Pro',
        description: 'High-performance laptop for professionals',
        price: 999.99,
        image: 'https://via.placeholder.com/200?text=Laptop',
      ),
      ProductModel(
        id: '2',
        name: 'Wireless Headphones',
        description: 'Premium noise-cancelling headphones',
        price: 199.99,
        image: 'https://via.placeholder.com/200?text=Headphones',
      ),
      ProductModel(
        id: '3',
        name: 'Smartphone',
        description: 'Latest generation smartphone',
        price: 799.99,
        image: 'https://via.placeholder.com/200?text=Smartphone',
      ),
      ProductModel(
        id: '4',
        name: 'Smartwatch',
        description: 'Feature-rich smartwatch',
        price: 299.99,
        image: 'https://via.placeholder.com/200?text=Smartwatch',
      ),
      ProductModel(
        id: '5',
        name: 'Tablet',
        description: 'Portable tablet for work and entertainment',
        price: 499.99,
        image: 'https://via.placeholder.com/200?text=Tablet',
      ),
      ProductModel(
        id: '6',
        name: 'Camera',
        description: 'Professional digital camera',
        price: 1299.99,
        image: 'https://via.placeholder.com/200?text=Camera',
      ),
    ];
  }
}


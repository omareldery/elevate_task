import 'package:elevate_task/features/home/domain/repos/product_repo_interface.dart';

import '../models/product_model.dart';
import '../services/product_service_interface.dart';

class ProductRepository implements ProductRepoInterface {
  final ProductServiceInterface productService;

  ProductRepository(this.productService);

  @override
  Future<List<ProductModel>> getProducts() async {
    try {
      final products = await productService.getProducts();
      return products;
    } catch (e) {
      throw Exception('Error fetching products: $e');
    }
  }
}

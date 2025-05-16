import '../models/product_model.dart';
import '../services/product_service_interface.dart';
import 'product_repo_interface.dart';

class ProductRepository implements ProductRepoInterface {
  final ProductServiceInterface productService;

  ProductRepository(this.productService);

  @override
  Future<List<ProductModel>> getProducts() async {
    try {
      return await productService.getProducts();
    } catch (e) {
      throw Exception('Error fetching products: $e');
    }
  }
}

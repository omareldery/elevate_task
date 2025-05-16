import '../models/product_model.dart';

abstract class ProductRepoInterface {
  Future<List<ProductModel>> getProducts();
}

import '../models/product_model.dart';

abstract class ProductServiceInterface {
  Future<List<ProductModel>> getProducts();
}

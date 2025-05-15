import 'package:elevate_task/features/home/domain/repos/product_repo_interface.dart';
import 'package:get/get.dart';
import '../domain/models/product_model.dart';

class HomeController extends GetxController {
  final ProductRepoInterface _productRepository = Get.find();

  List<ProductModel> _products = [];

  List<ProductModel> get products => _products;
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  String? error;

  @override
  void onInit() {
    super.onInit();
    getProducts();
  }

  Future<void> getProducts() async {
    _isLoading = true;
    error = null;
    update();

    try {
      _products = await _productRepository.getProducts();
    } catch (e) {
      error = e.toString();
    } finally {
      _isLoading = false;
      update();
    }
  }
}

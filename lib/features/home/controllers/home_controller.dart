import 'package:elevate_task/features/home/domain/repos/product_repo_interface.dart';
import 'package:get/get.dart';
import '../domain/models/product_model.dart';

class HomeController extends GetxController implements GetxService {
  final ProductRepoInterface productRepoInterface;

  HomeController(this.productRepoInterface);

  List<ProductModel> _products = [];

  List<ProductModel> get products => _products;
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  String? error;
  final Map<int, bool> selectedMap = {};

  bool isSelected(int index) => selectedMap[index] ?? false;

  @override
  void onInit() {
    super.onInit();
    getProducts();
  }

  void toggleFavorite(int index) {
    selectedMap[index] = !(selectedMap[index] ?? false);
    update();
  }

  Future<void> getProducts() async {
    _isLoading = true;
    error = null;
    update();

    try {
      _products = await productRepoInterface.getProducts();
    } catch (e) {
      error = e.toString();
    } finally {
      _isLoading = false;
      update();
    }
  }
}

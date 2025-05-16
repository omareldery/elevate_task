import 'package:elevate_task/utils/app_constants.dart';
import 'package:get/get.dart';
import '../features/home/controllers/home_controller.dart';
import '../features/home/domain/repos/product_repository.dart';
import '../features/home/domain/services/product_service.dart';
import '../features/home/domain/services/product_service_interface.dart';

class GetDi extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductServiceInterface>(
      () => ProductService(AppConstants.baseUrl),
    );
    Get.lazyPut(
      () => ProductRepository(
        Get.find<ProductServiceInterface>(),
      ),
    );
    Get.lazyPut(
      () => HomeController(
        Get.find<ProductRepository>(),
      ),
    );
  }
}

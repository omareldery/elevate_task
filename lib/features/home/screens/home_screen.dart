import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import '../controllers/home_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
@override
initState() {
  Get.find<HomeController>().getProducts();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: RefreshIndicator(
        onRefresh: () => Get.find<HomeController>().getProducts(),
        child: GetBuilder<HomeController>(
          builder: (controller) {
            if (controller.isLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (controller.error != null) {
              return Center(child: Text('Error: ${controller.error}'));
            } else {
              return ListView.builder(
                itemCount: controller.products.length,
                itemBuilder: (context, index) {
                  final product = controller.products[index];
                  return ListTile(
                    title: Text(product.title ?? 'No title'),
                    subtitle: Text('${product.price}'),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}

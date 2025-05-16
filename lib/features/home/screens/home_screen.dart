import 'package:elevate_task/features/home/widgets/recycler_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Get.find<HomeController>().getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: const Text('Products'),
        centerTitle: true,
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
              return ProductsBody();
            }
          },
        ),
      ),
    );
  }
}

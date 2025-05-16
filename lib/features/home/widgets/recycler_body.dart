import 'package:elevate_task/features/home/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../controllers/home_controller.dart';
import 'CustomGridView.dart';

class ProductsBody extends StatelessWidget {
  const ProductsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (homeController) {
        if (homeController.isLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (homeController.products.isNotEmpty) {
          return CustomGridView(
              childAspectRatio: 0.6,
              items: homeController.products,
              itemBuilder: (context, product,index) {
                return ProductCard(product: product, index: index,);
              });
        } else {
          return const Center(child: Text('No products Found'));
        }
      },
    );
  }
}

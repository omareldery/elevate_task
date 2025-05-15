import 'package:elevate_task/features/home/domain/services/product_service_interface.dart';
import 'package:elevate_task/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'features/home/domain/repos/product_repository.dart';
import 'features/home/domain/services/product_service.dart';
import 'features/home/screens/home_screen.dart';

void main() {
  Get.put(ProductRepository(ProductService(AppConstants.baseUrl)));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        builder: (context, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            home: HomeScreen(),
          );
        });
  }
}

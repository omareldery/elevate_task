import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/images.dart';
import '../controllers/home_controller.dart';
import '../domain/models/product_model.dart';

class ProductCard extends StatelessWidget {
  final ProductModel? product;
  final int index;

  const ProductCard({super.key, this.product, required this.index});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Card(
        color: Colors.white,
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(24)),
          side: BorderSide(color: AppColors.primaryColor, width: 1),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 350.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 150.h,
                  width: double.infinity,
                  child: Image.network(
                    product?.image ?? '',
                    fit: BoxFit.fitHeight,
                    errorBuilder: (context, error, stackTrace) =>
                        Icon(Icons.error_sharp),
                  ),
                ),
                SizedBox(height: 8.h),
                Flexible(
                  child: Text(
                    product?.title ?? '',
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        color: AppColors.primaryColor, fontSize: 16),
                  ),
                ),
                SizedBox(height: 8.h),
                Flexible(
                  child: Text(
                    product?.description ?? '',
                    maxLines: 2,
                    style: const TextStyle(
                        color: AppColors.primaryColor, fontSize: 12),
                  ),
                ),
                SizedBox(height: 8.h),
                RichText(
                  text: TextSpan(children: [
                    const TextSpan(
                      text: 'EGP ',
                      style: TextStyle(
                          color: AppColors.primaryColor, fontSize: 16),
                    ),
                    TextSpan(
                      text: product?.price.toString() ?? '',
                      style: const TextStyle(
                          color: AppColors.primaryColor, fontSize: 16),
                    ),
                  ]),
                ),
                SizedBox(height: 8.h),
                Row(
                  children: [
                    Flexible(
                      child: RichText(
                        text: TextSpan(
                          children: [
                            const TextSpan(
                              text: 'Review ',
                              style: TextStyle(
                                  color: AppColors.primaryColor, fontSize: 15),
                            ),
                            TextSpan(
                              text: '(${product?.rating?.rate})',
                              style: const TextStyle(
                                  color: AppColors.primaryColor, fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 4.w,),
                    Icon(Icons.star,
                        color: const Color(0xFFFDD407), size: 20.h),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.085,),
                    Container(
                      height: 25.h,
                      width: 25.w,
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
              ],
            ),
          ),
        ),
      ),
      GetBuilder<HomeController>(
        builder: (homeController) => Positioned(
          right: -8.w,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
            child: InkWell(
              onTap: () {
                homeController.toggleFavorite(index);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 25.h,
                    width: 25.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(24)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white,
                          spreadRadius: 4,
                          blurRadius: 15,
                          offset: const Offset(0, 0),
                        ),
                      ],
                    ),
                    child: homeController.isSelected(index)
                        ? Image.asset(
                            Images.filledFavIcon,
                          )
                        : Image.asset(
                            Images.favIcon,
                          ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ]);
  }
}

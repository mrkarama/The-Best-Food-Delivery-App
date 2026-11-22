import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:restaurant/Commons/Utils/extensions.dart';
import 'package:restaurant/Commons/Utils/styles.dart';
import 'package:restaurant/Commons/constants/colors.dart';
import 'package:restaurant/Commons/constants/constants.dart';
import 'package:restaurant/Controllers/blinkit_home_controller.dart';
import 'package:restaurant/Models/products_model.dart';
import 'package:restaurant/Views/blinkit%20home/widgets/some_product_tile_widget.dart';

class SomeProductsWidget extends StatelessWidget {
  final List<ProductsModel> products;
  const SomeProductsWidget({
    super.key,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: context.screenWidth,
        height: context.screenHeight * 1.6.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(
              15.r,
            ),
            topRight: Radius.circular(
              15.r,
            ),
          ),
          color: Colors.grey.shade300,
        ),
        child: Padding(
          padding: EdgeInsets.only(
            left: 10.w,
            right: 10.w,
            top: 25.h,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    products[0].category.toString(),
                    style: robotoBold.copyWith(
                      fontSize: 19.sp,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.find<BlinkitHomeController>().onLoadingShimmer();
                      Get.toNamed(
                        AppRouteNames.getAllProductRoute(),
                        arguments: {
                          "products": products,
                        },
                      );
                    },
                    child: Text(
                      'see_all'.tr,
                      style: robotoMedium.copyWith(
                        fontSize: 16.sp,
                        color: AppColors.mainColor,
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: ProductTileWidget(
                  products: products,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

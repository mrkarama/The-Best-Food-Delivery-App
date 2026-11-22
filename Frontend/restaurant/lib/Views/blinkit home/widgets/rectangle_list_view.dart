import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:restaurant/Commons/Utils/extensions.dart';
import 'package:restaurant/Commons/Utils/styles.dart';
import 'package:restaurant/Commons/constants/api_values.dart';
import 'package:restaurant/Commons/constants/colors.dart';
import 'package:restaurant/Commons/constants/constants.dart';
import 'package:restaurant/Controllers/blinkit_home_controller.dart';
import 'package:restaurant/Controllers/localization_controller.dart';
import 'package:restaurant/Models/products_model.dart';

class RectangleListView extends StatelessWidget {
  const RectangleListView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BlinkitHomeController>(
      builder: (blinkitHomeController) {
        return CarouselSlider.builder(
          itemCount: blinkitHomeController.shopNowCategoryProducts.length,
          options: CarouselOptions(
            autoPlay: true,
            enlargeCenterPage: true,
            enlargeStrategy: CenterPageEnlargeStrategy.height,
          ),
          itemBuilder: (context, index, p) {
            final List<ProductsModel> products =
                blinkitHomeController.shopNowCategoryProducts[index];
            return GestureDetector(
              onTap: () {
                Get.find<BlinkitHomeController>().onLoadingShimmer();
                Get.toNamed(
                  AppRouteNames.getAllProductRoute(),
                  arguments: {
                    "products": products,
                    "isAllProductsPage": false,
                    "listOfProducts":
                        blinkitHomeController.shopByCategoryProducts,
                  },
                );
              },
              child: Stack(
                children: [
                  Container(
                    width: context.screenWidth - 50.w,
                    height: 250.h,
                    margin: EdgeInsets.only(
                      right: 10.w,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        20.r,
                      ),
                      color: const Color.fromARGB(255, 235, 214, 172),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                        20.r,
                      ),
                      child: Image.network(
                        '${ApiValues.imageBaseUrl}${products[0].image.toString()}',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 20.w,
                    bottom: 20.w,
                    child: Container(
                      width:
                          Get.find<LocalizationController>().getCountryCode() ==
                                  'US'
                              ? 90.w
                              : 110.w,
                      height: 30.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          8.r,
                        ),
                        color: AppColors.mainColor,
                      ),
                      child: Center(
                        child: Text(
                          'shop_now'.tr,
                          style: robotoMedium.copyWith(
                            fontSize: 16.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

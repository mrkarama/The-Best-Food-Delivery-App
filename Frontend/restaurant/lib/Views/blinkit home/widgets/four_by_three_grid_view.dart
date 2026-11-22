import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:restaurant/Commons/Utils/styles.dart';
import 'package:restaurant/Commons/Widgets/spacer.dart';
import 'package:restaurant/Commons/constants/api_values.dart';
import 'package:restaurant/Commons/constants/constants.dart';
import 'package:restaurant/Controllers/blinkit_home_controller.dart';
import 'package:restaurant/Models/products_model.dart';

class FourBythreeGridView extends StatelessWidget {
  const FourBythreeGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BlinkitHomeController>(builder: (blinkitHomeController) {
      return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 10.h,
          crossAxisSpacing: 10.h,
          mainAxisExtent: 160.h,
        ),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: blinkitHomeController.shopByCategoryProducts.length,
        itemBuilder: (context, index) {
          List<ProductsModel> products =
              blinkitHomeController.shopByCategoryProducts[index];
          return GestureDetector(
            onTap: () {
              blinkitHomeController.onLoadingShimmer();
              Get.toNamed(
                AppRouteNames.getAllProductRoute(),
                arguments: {
                  'products': products,
                  'listOfProducts':
                      blinkitHomeController.shopByCategoryProducts,
                },
              );
            },
            child: Container(
              width: 110.h,
              // height: 250.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  5.r,
                ),
                // color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 100.h,
                    height: 100.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        10.r,
                      ),
                      color: const Color.fromARGB(255, 235, 214, 172),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                        10.r,
                      ),
                      child: Image.network(
                        '${ApiValues.imageBaseUrl}${products[0].image.toString()}',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  verticalSpacer(
                    5.h,
                  ),
                  Center(
                    child: Text(
                      products[0].category,
                      textAlign: TextAlign.center,
                      style: robotoMedium.copyWith(
                        fontSize: 16.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    });
  }
}

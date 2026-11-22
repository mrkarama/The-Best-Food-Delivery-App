import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:restaurant/Commons/Utils/styles.dart';
import 'package:restaurant/Commons/constants/constants.dart';
import 'package:restaurant/Controllers/blinkit_home_controller.dart';
import 'package:restaurant/Models/products_model.dart';

class BestSellerCustomAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final List<ProductsModel> products;
  final List<List<ProductsModel>> listOfProducts;
  const BestSellerCustomAppBar({
    super.key,
    required this.products,
    required this.listOfProducts,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BlinkitHomeController>(builder: (blinkitHomeController) {
      return Container(
        padding: EdgeInsets.only(
          top: 10.h,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    size: 24.sp,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      products[0].category.toString(),
                      style: robotoMedium.copyWith(
                        fontSize: 16.sp,
                      ),
                    ),
                    Text(
                      '${products.length.toString()} ' + 'products'.tr,
                      style: robotoRegular.copyWith(
                        fontSize: 15.sp,
                      ),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {
                    Get.toNamed(
                      AppRouteNames.getSearchRoute(),
                    );
                  },
                  icon: Icon(
                    Icons.search,
                    size: 24.sp,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }

  @override
  Size get preferredSize => Size(
        Get.context!.width,
        Get.context!.height / 7.h - 45.h,
      );
}

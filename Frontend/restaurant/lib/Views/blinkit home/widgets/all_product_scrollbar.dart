import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:restaurant/Commons/Utils/styles.dart';
import 'package:restaurant/Commons/Widgets/spacer.dart';
import 'package:restaurant/Commons/constants/api_values.dart';
import 'package:restaurant/Commons/constants/colors.dart';
import 'package:restaurant/Commons/constants/constants.dart';
import 'package:restaurant/Controllers/blinkit_home_controller.dart';
import 'package:restaurant/Models/products_model.dart';

class AllProductsScrollbar extends StatelessWidget {
  final List<ProductsModel> products;
  const AllProductsScrollbar({
    super.key,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return RawScrollbar(
      trackVisibility: true,
      thumbVisibility: true,
      thumbColor: AppColors.mainColor,
      thickness: 5.w,
      interactive: true,
      radius: Radius.circular(
        5.r,
      ),
      child: SizedBox(
        width: 80.w,
        height: context.height,
        child: ListView.builder(
          itemCount: products.length,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            final ProductsModel product = products[index];
            return GestureDetector(
              onTap: () {
                Get.find<BlinkitHomeController>().onSingleItemLoading();
                if (double.parse(product.rating) > 4) {
                  Get.toNamed(
                    AppRouteNames.getPopularRoute(),
                    arguments: {
                      'id': product.id,
                      'title': product.title,
                      'description': product.description,
                      'category': product.category,
                      'image': product.image,
                      'rating': product.rating,
                      'price': product.price,
                    },
                  );
                } else {
                  Get.toNamed(
                    AppRouteNames.getRecommendedRoute(),
                    arguments: {
                      'id': product.id,
                      'title': product.title,
                      'description': product.description,
                      'category': product.category,
                      'image': product.image,
                      'rating': product.rating,
                      'price': product.price,
                    },
                  );
                }
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 70.h,
                    width: 70.w,
                    margin: EdgeInsets.only(
                      right: 10.w,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        30.r,
                      ),
                      color: Colors.grey.shade300,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                        30.r,
                      ),
                      child: Image.network(
                        '${ApiValues.imageBaseUrl}${product.image.toString()}',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  verticalSpacer(
                    10.h,
                  ),
                  Center(
                    child: Text(
                      product.title.toString(),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: robotoMedium.copyWith(
                        fontSize: 15.sp,
                      ),
                    ),
                  ),
                  verticalSpacer(
                    20.h,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:restaurant/Commons/Utils/extensions.dart';
import 'package:restaurant/Commons/Utils/styles.dart';
import 'package:restaurant/Commons/Widgets/spacer.dart';
import 'package:restaurant/Commons/constants/api_values.dart';
import 'package:restaurant/Commons/constants/colors.dart';
import 'package:restaurant/Commons/constants/route_names.dart';
import 'package:restaurant/Controllers/blinkit_home_controller.dart';
import 'package:restaurant/Models/products_model.dart';

class ProductTileWidget2 extends StatelessWidget {
  final List<ProductsModel> products;
  const ProductTileWidget2({
    super.key,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: products.length,
      shrinkWrap: true,
      physics: const AlwaysScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10.w,
        crossAxisSpacing: 10.h,
        mainAxisExtent: context.screenWidth - 20.h,
      ),
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
          child: Container(
            width: context.screenWidth / 2 - 30.w,
            margin: EdgeInsets.only(
              top: 20.h,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                15.r,
              ),
              color: AppColors.backgroundColor,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: (context.screenWidth - 30.h) / 2 + 40.h,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                      20.r,
                    ),
                    child: Image.network(
                      '${ApiValues.imageBaseUrl}${product.image.toString()}',
                      // width: AppValues.screenWidth / 2 - 30.w,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 10.h,
                    left: 10.w,
                    right: 10.w,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.title.toString(),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: robotoMedium.copyWith(
                          fontSize: 16.sp,
                        ),
                      ),
                      verticalSpacer(
                        5.h,
                      ),
                      Container(
                        width: 50.w,
                        height: 24.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            7.r,
                          ),
                          color: AppColors.mainColor,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              product.rating.toString(),
                              style: robotoBlack.copyWith(
                                fontSize: 15.sp,
                              ),
                            ),
                            Icon(
                              Icons.star,
                              size: 18.sp,
                            ),
                          ],
                        ),
                      ),
                      // Text(
                      //   '77 g',
                      //   style: robotoRegular.copyWith(
                      //     fontSize: 15.sp,
                      //   ),
                      // ),
                      verticalSpacer(
                        20.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\$${product.price.toString()}',
                            style: robotoMedium.copyWith(
                              fontSize: 16.sp,
                            ),
                          ),
                          product.category == 'Noodles' ||
                                  product.category == 'Cake' ||
                                  product.category == 'Momos'
                              ? Text(
                                  '\$${double.parse((product.price / 0.8).toStringAsFixed(2))}',
                                  style: robotoRegular.copyWith(
                                    fontSize: 16.sp,
                                    decoration: TextDecoration.lineThrough,
                                    decorationThickness: 1.5,
                                  ),
                                )
                              : const SizedBox.shrink(),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

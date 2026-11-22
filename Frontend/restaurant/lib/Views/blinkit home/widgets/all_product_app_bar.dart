import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:restaurant/Commons/Utils/extensions.dart';
import 'package:restaurant/Commons/Utils/styles.dart';
import 'package:restaurant/Commons/Widgets/custom_snackbar.dart';
import 'package:restaurant/Commons/Widgets/spacer.dart';
import 'package:restaurant/Commons/constants/constants.dart';
import 'package:restaurant/Controllers/blinkit_home_controller.dart';
import 'package:restaurant/Models/products_model.dart';
import 'package:restaurant/Views/blinkit%20home/widgets/sort_by_widget.dart';
import 'package:restaurant/commons/constants/colors.dart';
import 'package:shimmer/shimmer.dart';

class AllProductsCustomAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final List<ProductsModel> products;
  final List<List<ProductsModel>> listOfProducts;
  final bool? isAllProductsPage;
  const AllProductsCustomAppBar({
    super.key,
    required this.products,
    this.isAllProductsPage = true,
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
            verticalSpacer(
              15.h,
            ),
            isAllProductsPage!
                ? SizedBox(
                    width: context.screenWidth,
                    height: 40.h,
                    child: ListView.builder(
                      itemCount: listOfProducts.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return blinkitHomeController.isLoadingShimmer
                            ? Shimmer.fromColors(
                                baseColor: Colors.grey.shade400,
                                highlightColor: Colors.grey.shade100,
                                child: Container(
                                  width: 100.w,
                                  height: 40.h,
                                  margin: EdgeInsets.only(
                                    left: 10.w,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      7.r,
                                    ),
                                    color: Colors.grey,
                                  ),
                                ),
                              )
                            : Container(
                                width: 100.w,
                                height: 40.h,
                                margin: EdgeInsets.only(
                                  left: 10.w,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    7.r,
                                  ),
                                  color: Colors.grey.shade300,
                                ),
                                child: index == 0
                                    ? GestureDetector(
                                        onTap: () {
                                          showSort(
                                            context,
                                          );
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Icon(
                                              Icons.swap_vert,
                                              size: 24.sp,
                                            ),
                                            Text(
                                              'sort'.tr,
                                              style: robotoRegular.copyWith(
                                                fontSize: 16.sp,
                                              ),
                                            ),
                                            Icon(
                                              Icons.arrow_drop_down,
                                              size: 24.sp,
                                            ),
                                          ],
                                        ),
                                      )
                                    : GestureDetector(
                                        onTap: () {
                                          CustomSnackbar(
                                            'coming_feature_message'.tr,
                                            AppColors.mainColor,
                                            title: 'coming_feature_title'.tr,
                                          );
                                        },
                                        child: Center(
                                          child: Text(
                                            listOfProducts[index][0].category,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: robotoRegular.copyWith(
                                              fontSize: 16.sp,
                                            ),
                                          ),
                                        ),
                                      ),
                              );
                      },
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        ),
      );
    });
  }

  @override
  Size get preferredSize => Size(
        Get.context!.width,
        isAllProductsPage!
            ? Get.context!.height / 7.h
            : Get.context!.height / 7.h - 20.h,
      );

  void showSort(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isDismissible: true,
      enableDrag: true,
      elevation: 0,
      builder: (context) {
        return ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(
              15.r,
            ),
            topRight: Radius.circular(
              15.r,
            ),
          ),
          child: Container(
            width: context.screenWidth,
            height: context.screenHeight / 3.5,
            padding: EdgeInsets.only(
              //left: 10.w,
              top: 20.h,
            ),
            decoration: const BoxDecoration(
              color: AppColors.backgroundColor,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: 10.w,
                  ),
                  child: Text(
                    'sort_by'.tr,
                    style: robotoBold.copyWith(
                      fontSize: 22.sp,
                    ),
                  ),
                ),
                verticalSpacer(
                  20.h,
                ),
                Divider(
                  thickness: 1.w,
                  color: Colors.black45,
                  endIndent: 20.w,
                  indent: 10.w,
                ),
                SortByWidget(
                  title: 'default'.tr,
                  radioValue: 'default',
                ),
                SortByWidget(
                  title: 'low_to_high'.tr,
                  radioValue: 'low to high',
                ),
                SortByWidget(
                  title: 'high_to_low'.tr,
                  radioValue: 'high to low',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

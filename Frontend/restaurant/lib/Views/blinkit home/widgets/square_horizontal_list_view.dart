import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:restaurant/Commons/Utils/styles.dart';
import 'package:restaurant/Commons/Widgets/spacer.dart';
import 'package:restaurant/Commons/constants/api_values.dart';
import 'package:restaurant/Commons/constants/colors.dart';
import 'package:restaurant/Models/products_model.dart';

import 'some_products_widget.dart';

class SquareHosrizontalListView extends StatelessWidget {
  final List<List<ProductsModel>> products;
  const SquareHosrizontalListView({
    super.key,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        final List<ProductsModel> listOfProducts = products[index];
        return GestureDetector(
          onTap: () {
            showSomeProducts(
              context,
              listOfProducts,
            );
          },
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                  right: 10.w,
                ),
                padding: EdgeInsets.only(
                  left: 8.w,
                  right: 8.w,
                  top: 8.w,
                  bottom: 8.w,
                ),
                width: 140.h,
                height: 140.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    15.r,
                  ),
                  color: const Color.fromARGB(255, 235, 214, 172),
                ),
                child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: 4,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 5.w,
                    crossAxisSpacing: 5.w,
                  ),
                  itemBuilder: (context, index) {
                    final ProductsModel productGridView = listOfProducts[index];
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          10.r,
                        ),
                        color: Colors.white,
                      ),
                      child: index == 3
                          ? Center(
                              child: Text(
                                '+${listOfProducts.length - 3}',
                                style: robotoBold.copyWith(
                                  fontSize: 20.sp,
                                  color: Colors.black54,
                                ),
                              ),
                            )
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(
                                30.r,
                              ),
                              child: Image.network(
                                '${ApiValues.imageBaseUrl}${productGridView.image.toString()}',
                                width: 60.h,
                                fit: BoxFit.cover,
                              ),
                            ),
                    );
                  },
                ),
              ),
              verticalSpacer(
                8.h,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    listOfProducts[index].category,
                    style: robotoMedium.copyWith(
                      fontSize: 16.sp,
                    ),
                  ),
                  Text(
                    '${listOfProducts.length.toString()} ' + 'products'.tr,
                    style: robotoRegular.copyWith(
                      fontSize: 15.sp,
                    ),
                  ),
                ],
              ),
              verticalSpacer(
                20.h,
              ),
              Container(
                width: 130.h,
                height: 30.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    5.r,
                  ),
                  border: Border.all(
                    color: AppColors.mainColor,
                    width: 0.5.w,
                  ),
                ),
                child: Center(
                  child: Text(
                    'see all',
                    style: robotoMedium.copyWith(
                      fontSize: 16.sp,
                      color: AppColors.mainColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void showSomeProducts(
    BuildContext context,
    List<ProductsModel> products,
  ) {
    showModalBottomSheet(
      context: context,
      elevation: 0,
      enableDrag: true,
      isDismissible: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return SomeProductsWidget(
          products: products,
        );
      },
    );
  }
}

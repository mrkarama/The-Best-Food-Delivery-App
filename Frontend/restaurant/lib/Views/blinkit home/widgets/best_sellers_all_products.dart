import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:restaurant/Commons/Utils/extensions.dart';
import 'package:restaurant/Controllers/blinkit_home_controller.dart';
import 'package:restaurant/Models/products_model.dart';
import 'package:restaurant/Shimmers/all_products_shimmer.dart';
import 'package:restaurant/Views/blinkit%20home/widgets/all_product_tile_widget.dart';
import 'package:restaurant/Views/blinkit%20home/widgets/best_sellers_app_bar.dart';

class AllProductsBestSeller extends StatefulWidget {
  const AllProductsBestSeller({
    super.key,
  });

  @override
  State<AllProductsBestSeller> createState() => _AllProductsBestSellerState();
}

class _AllProductsBestSellerState extends State<AllProductsBestSeller> {
  late List<ProductsModel> products;

  late Map<String, dynamic> data;

  @override
  void initState() {
    super.initState();
    data = Get.arguments;
    products = data["products"];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:
          GetBuilder<BlinkitHomeController>(builder: (blinkitHomeController) {
        return Scaffold(
          appBar: BestSellerCustomAppBar(
            products: products,
            listOfProducts: blinkitHomeController.shopByCategoryProducts,
          ),
          body: blinkitHomeController.isLoadingShimmer
              ? const AllProductsShimmer()
              : Padding(
                  padding: EdgeInsets.only(
                    left: 10.w,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          height: context.screenHeight + 100.h,
                          color: Colors.grey.shade300,
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: 10.w,
                              right: 10.w,
                              bottom: (context.screenWidth - 20.h) / 2,
                            ),
                            child: ProductTileWidget2(
                              products: products,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        );
      }),
    );
  }
}

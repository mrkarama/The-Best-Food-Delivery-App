import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:restaurant/Commons/Utils/extensions.dart';
import 'package:restaurant/Controllers/blinkit_home_controller.dart';
import 'package:restaurant/Models/products_model.dart';
import 'package:restaurant/Shimmers/all_products_shimmer.dart';
import 'package:restaurant/Views/blinkit%20home/widgets/all_product_app_bar.dart';
import 'package:restaurant/Views/blinkit%20home/widgets/all_product_scrollbar.dart';
import 'package:restaurant/Views/blinkit%20home/widgets/all_product_tile_widget.dart';

class AllProductsWidget extends StatefulWidget {
  const AllProductsWidget({
    super.key,
  });

  @override
  State<AllProductsWidget> createState() => _AllProductsWidgetState();
}

class _AllProductsWidgetState extends State<AllProductsWidget> {
  late List<ProductsModel> products;
  late bool isAllProductsPage;
  late Map<String, dynamic> data;

  @override
  void initState() {
    super.initState();
    data = Get.arguments;
    products = data["products"];
    if (data['isAllProductsPage'] != null) {
      isAllProductsPage = data['isAllProductsPage'];
    } else {
      isAllProductsPage = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:
          GetBuilder<BlinkitHomeController>(builder: (blinkitHomeController) {
        return Scaffold(
          appBar: AllProductsCustomAppBar(
            products: products,
            listOfProducts: blinkitHomeController.shopByCategoryProducts,
          ),
          body: blinkitHomeController.isLoadingShimmer
              ? const AllProductsShimmer()
              : Padding(
                  padding: EdgeInsets.only(
                    left: 10.w,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      isAllProductsPage
                          ? AllProductsScrollbar(
                              products: products,
                            )
                          : const SizedBox.shrink(),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Container(
                            height: context.screenHeight,
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
                        ),
                      ),
                    ],
                  ),
                ),
        );
      }),
    );
  }
}

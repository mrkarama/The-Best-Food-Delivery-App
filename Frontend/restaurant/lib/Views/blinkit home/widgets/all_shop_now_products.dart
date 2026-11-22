import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:restaurant/Commons/Utils/extensions.dart';
import 'package:restaurant/Models/products_model.dart';
import 'package:restaurant/Views/blinkit%20home/widgets/all_product_app_bar.dart';
import 'package:restaurant/Views/blinkit%20home/widgets/all_product_scrollbar.dart';
import 'package:restaurant/Views/blinkit%20home/widgets/all_product_tile_widget.dart';

class AllShopNowProductsWidget extends StatefulWidget {
  const AllShopNowProductsWidget({super.key});

  @override
  State<AllShopNowProductsWidget> createState() =>
      _AllShopNowProductsWidgetState();
}

class _AllShopNowProductsWidgetState extends State<AllShopNowProductsWidget> {
  late List<ProductsModel> products;
  late List<List<ProductsModel>> listOfProducts;
  late Map<String, dynamic> data;

  @override
  void initState() {
    super.initState();
    data = Get.arguments;
    products = data["products"];
    listOfProducts = data['listOfProducts'];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AllProductsCustomAppBar(
          products: products,
          isAllProductsPage: false,
          listOfProducts: listOfProducts,
        ),
        body: Padding(
          padding: EdgeInsets.only(
            left: 10.w,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AllProductsScrollbar(
                products: products,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    height: context.screenHeight,
                    color: Colors.grey.shade300,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 10.w,
                        right: 10.w,
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
      ),
    );
  }
}

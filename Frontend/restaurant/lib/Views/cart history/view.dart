import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:restaurant/Commons/Utils/styles.dart';
import 'package:restaurant/Controllers/cart_history_controller.dart';
import 'package:restaurant/Views/my%20order/widgets/order_app_bar.dart';
import 'package:restaurant/commons/constants/api_values.dart';
import 'package:restaurant/commons/constants/colors.dart';
import 'package:restaurant/commons/constants/route_names.dart';
import 'package:restaurant/commons/widgets/custom_loader.dart';
import 'package:restaurant/commons/widgets/custom_texts.dart';
import 'package:restaurant/commons/widgets/no_data.dart';
import 'package:restaurant/commons/widgets/spacer.dart';

class CartHistoryPage extends StatefulWidget {
  const CartHistoryPage({Key? key}) : super(key: key);

  @override
  State<CartHistoryPage> createState() => _CartHistoryPageState();
}

class _CartHistoryPageState extends State<CartHistoryPage> {
  @override
  void initState() {
    super.initState();
    Get.find<CartHistoryController>().getCartHistoryData();
  }

  @override
  Widget build(BuildContext context) {
    //Get.find<CartHistoryController>().getCartHistoryData();
    Get.find<CartHistoryController>().getUserToken();
    var listCounter = 0;
    return GetBuilder<CartHistoryController>(builder: (cartHistoryController) {
      return SafeArea(
        child: Scaffold(
          appBar: MyOrderAppBar(
            text: 'your_cart_history'.tr,
          ),
          body: Container(
            margin: EdgeInsets.only(
              top: 20.h,
            ),
            child: cartHistoryController.cartHistoryData.isEmpty
                ? NoDataPage(
                    imageUrl: 'assets/images/empty_box.png',
                    text: 'your_cart_history_is_empty'.tr,
                    isCartHistory: true,
                  )
                : cartHistoryController.isLoading
                    ? const CustomLoader()
                    : ListView(
                        scrollDirection: Axis.vertical,
                        children: [
                          for (int i = 0;
                              i <
                                  cartHistoryController
                                      .cartOrderTimeIntList.length;
                              ++i)
                            Container(
                              margin: EdgeInsets.only(
                                left: 10.w,
                                right: 10.w,
                                bottom: 15.h,
                              ),
                              height: 140.h,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        cartHistoryController
                                            .transformDataFormat(
                                          cartHistoryController
                                              .cartHistoryData[listCounter].time
                                              .toString(),
                                        ),
                                        style: robotoMedium.copyWith(
                                          fontSize: 22.sp,
                                        ),
                                      ),
                                      verticalSpacer(
                                        7.h,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Wrap(
                                            children: List.generate(
                                                cartHistoryController
                                                                .cartOrderTimeIntList[
                                                            i] >=
                                                        3
                                                    ? 3
                                                    : cartHistoryController
                                                        .cartOrderTimeIntList[i],
                                                (index) {
                                              if (listCounter <
                                                  cartHistoryController
                                                      .cartHistoryData.length) {
                                                listCounter = listCounter + 1;
                                              }
                                              return Container(
                                                margin: EdgeInsets.only(
                                                  right: 8.w,
                                                ),
                                                width: 87.w,
                                                height: 87.w,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                    12.r,
                                                  ),
                                                  image: DecorationImage(
                                                    image: NetworkImage(
                                                      '${ApiValues.imageBaseUrl}${cartHistoryController.cartHistoryData[listCounter - 1].image.toString()}',
                                                    ),
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                              );
                                            }),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      verticalSpacer(
                                        30.h,
                                      ),
                                      resizableText(
                                        text: 'total'.tr,
                                        fontSize: 17.sp,
                                        fontWeight: FontWeight.normal,
                                      ),
                                      verticalSpacer(
                                        11.h,
                                      ),
                                      SizedBox(
                                        child: Text(
                                          cartHistoryController
                                                      .cartOrderTimeIntList[i] >
                                                  1
                                              ? '${cartHistoryController.cartOrderTimeIntList[i].toString()} ${'items'.tr}'
                                              : '${cartHistoryController.cartOrderTimeIntList[i].toString()} ${'item'.tr}',
                                          style: robotoMedium.copyWith(
                                            fontSize: 22.sp,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      verticalSpacer(
                                        11.h,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          cartHistoryController
                                              .getOrderTimeItems(i);
                                          Get.toNamed(
                                            AppRouteNames.getCartRoute(),
                                          );
                                        },
                                        child: Container(
                                          width: 70.w,
                                          height: 24.h,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              5.r,
                                            ),
                                            border: Border.all(
                                              color: AppColors.mainColor,
                                              width: 2.w,
                                            ),
                                          ),
                                          child: Center(
                                            child: smallext(
                                              text: 'one_more'.tr,
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.mainColor,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                        ],
                      ),
          ),
        ),
      );
    });
  }
}

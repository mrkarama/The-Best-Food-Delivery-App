import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:restaurant/Commons/Widgets/no_data.dart';
import 'package:restaurant/Commons/constants/colors.dart';
import 'package:restaurant/Commons/constants/constants.dart';
import 'package:restaurant/Commons/widgets/custom_texts.dart';
import 'package:restaurant/Commons/widgets/spacer.dart';
import 'package:restaurant/Controllers/payment_controller.dart';
import 'package:restaurant/Models/order_model.dart';

class MyOrderTab extends StatelessWidget {
  final bool isCurrent;
  const MyOrderTab({super.key, required this.isCurrent});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PaymentController>(
      builder: (paymentController) {
        if (Get.find<PaymentController>().isLoading == false) {
          late List<OrderModel> listOfOrderModel;
          if (Get.find<PaymentController>().currentOrderData.isNotEmpty) {
            listOfOrderModel = isCurrent
                ? Get.find<PaymentController>()
                    .currentOrderData
                    .reversed
                    .toList()
                : Get.find<PaymentController>()
                    .historyOrderData
                    .reversed
                    .toList();
            return ListView.builder(
              itemCount: listOfOrderModel.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                final OrderModel orderModel = listOfOrderModel[index];
                return Padding(
                  padding: EdgeInsets.only(
                    top: 15.h,
                    left: 10.w,
                    right: 10.w,
                  ),
                  child: Container(
                    height: 60.h,
                    margin: EdgeInsets.only(
                      bottom: 20.h,
                    ),
                    //color: Colors.redAccent,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        resizableText(
                          text: '${"order_ID_#".tr}${orderModel.id.toString()}',
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              width: 85.w,
                              height: 25.h,
                              decoration: BoxDecoration(
                                color: AppColors.mainColor,
                                borderRadius: BorderRadius.circular(
                                  5.r,
                                ),
                              ),
                              child: Center(
                                child: mediumText(
                                  text:
                                      isCurrent ? 'pending'.tr : 'confirmed'.tr,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            verticalSpacer(
                              5.h,
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.toNamed(
                                  AppRouteNames.getTrackOrderRoute(),
                                  arguments: {
                                    "orderId": orderModel.id,
                                  },
                                );
                              },
                              child: Row(
                                children: [
                                  Container(
                                    width: 30.w,
                                    height: 30.w,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(
                                        5.r,
                                      ),
                                      border: Border.all(
                                        width: 2.0,
                                        color: AppColors.mainColor,
                                      ),
                                    ),
                                    child: Center(
                                      child: Image.asset(
                                        'assets/images/tracking.png',
                                        color: AppColors.mainColor,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 100.w,
                                    height: 30.h,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(
                                        5.r,
                                      ),
                                      border: Border.all(
                                        width: 2.0,
                                        color: AppColors.mainColor,
                                      ),
                                    ),
                                    child: Center(
                                      child: mediumText(
                                        text: 'track_order'.tr,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          }
        } else if (Get.find<PaymentController>().isLoading == true) {
          return Center(
            child: CircularProgressIndicator(
              valueColor:
                  AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
            ),
          );
        }
        return NoDataPage(
          imageUrl: 'assets/images/no_order.png',
          text: 'no_orders'.tr,
          isCartHistory: false,
        );
      },
    );
  }
}

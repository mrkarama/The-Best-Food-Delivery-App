import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant/Commons/constants/colors.dart';
import 'package:restaurant/Controllers/payment_controller.dart';
import 'package:restaurant/Controllers/person_controller.dart';
import 'package:restaurant/Views/my%20order/widgets/order_app_bar.dart';
import 'package:restaurant/Views/my%20order/widgets/order_tab.dart';

class MyOrder extends StatefulWidget {
  const MyOrder({super.key});

  @override
  State<MyOrder> createState() => _MyOrderState();
}

class _MyOrderState extends State<MyOrder> with TickerProviderStateMixin {
  late TabController tabController;
  late bool isUserLoggedIn;

  @override
  void initState() {
    super.initState();
    Get.find<PersonController>().isUserLogged();
    isUserLoggedIn = Get.find<PersonController>().isUserLogged();
    if (isUserLoggedIn) {
      tabController = TabController(length: 2, vsync: this);
      Get.find<PaymentController>().getOrderData();
    } else {
      tabController = TabController(length: 2, vsync: this);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: MyOrderAppBar(
          text: 'my_orders'.tr,
        ),
        body: RefreshIndicator(
          onRefresh: Get.find<PaymentController>().getOrderData,
          backgroundColor: AppColors.backgroundColor,
          color: AppColors.mainColor,
          child: Column(
            children: [
              SizedBox(
                height: 60.h,
                child: TabBar(
                  controller: tabController,
                  indicatorColor: AppColors.mainColor,
                  indicatorWeight: 4.0,
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelStyle: GoogleFonts.roboto(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none,
                  ),
                  labelColor: AppColors.mainColor,
                  unselectedLabelColor: AppColors.yellowColor,
                  tabs: [
                    Tab(
                      text: 'current'.tr,
                    ),
                    Tab(
                      text: 'history'.tr,
                    )
                  ],
                ),
              ),
              GetBuilder<PaymentController>(builder: (paymentController) {
                return Expanded(
                  child: TabBarView(
                    controller: tabController,
                    children: const [
                      MyOrderTab(
                        isCurrent: true,
                      ),
                      MyOrderTab(
                        isCurrent: false,
                      ),
                    ],
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
